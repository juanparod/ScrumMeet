//
//  MeetingsViewModel.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 19/08/23.
//

import Combine
import FirebaseDatabase
import SwiftUI

class MeetingsListViewModel: ObservableObject {
    @Published var meetings: [Meeting] = []
    @Published var navigationPath: [NavigationPath] = []
    @Published var currentMeetingIndex: Int?
    @Published var currentStatusIndex: Int?
    private var cancellables = Set<AnyCancellable>()
    
    var currentMeeting: Meeting {
        get {
            if let index = currentMeetingIndex {
                return meetings[index]
            }
            return Meeting()
        }
        set {
            if let index = currentMeetingIndex {
                meetings[index] = newValue
            }
        }
    }
    var currentStatus: DailyStatus {
        get {
            if let index = currentStatusIndex {
                return currentMeeting.statuses[index]
            }
            return DailyStatus()
        }
        
        set {
            if let index = currentStatusIndex {
                currentMeeting.statuses[index] = newValue
            }
        }
    }
    
    init() {
        NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
            .sink(receiveValue: appWillResignActive)
            .store(in: &cancellables)
        
    }
    
    func addMeetingButtonTapped() {
        createMeeting()
    }
    
    func addStatusButtonTapped() {
        createStatus()
    }
    
    func createMeeting() {
        let meeting = Meeting()
        meetings.append(meeting)
        navigate(to: meeting)
    }
    
    func createStatus() {
        let status = DailyStatus()
        currentMeeting.statuses.append(status)
        navigate(to: status)
    }
    
    func navigate(to meeting: Meeting) {
        navigationPath.append(.meeting(meeting.id))
    }
    
    func navigate(to status: DailyStatus) {
        navigationPath.append(.status(status.id))
    }
    
    func setMeeting(for id: String) {
        if let index = meetings.firstIndex(where: { existingMeeting in
            existingMeeting.id == id
        }) {
            currentMeetingIndex = index
        }
    }
    
    func setStatus(for id: String) {
        if let index = currentMeeting.statuses.firstIndex(where: { existingMeeting in
            existingMeeting.id == id
        }) {
            currentStatusIndex = index
        }
    }
    
    func popNavigation() {
        navigationPath.removeLast()
    }
    
    func deleteMeeting(at indexSet: IndexSet) {
        meetings.remove(atOffsets: indexSet)
    }
    
    func onViewAppear() {
        Task {
            await getDataFromCloud()
        }
    }
    
    func saveDataToCloud() async {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(meetings)
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            let obj = json as? [[String: Any]]
            try await Database.database().reference().setValue(obj)
        }
        catch {
            print("Error saving data to cloud: \(error)")
        }
    }
    
    @MainActor
    func getDataFromCloud() async {
        do {
            if let jsonObject = try await Database.database().reference().getData().value {
                let data = try JSONSerialization.data(withJSONObject: jsonObject)
                let decoder = JSONDecoder()
                meetings = try decoder.decode([Meeting].self, from: data)
            }
        }
        catch {
            print("Error getting data from cloud: \(error)")
        }
    }
    
    func appWillResignActive(notification: Notification) {
        Task {
            await saveDataToCloud()
        }
    }
}

enum NavigationPath: Hashable {
    case meeting(String)
    case status(String)
}
