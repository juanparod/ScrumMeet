//
//  MeetingsViewModel.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 19/08/23.
//

import SwiftUI

class MeetingsListViewModel: ObservableObject {
    @Published var meetings: [Meeting] = Meeting.listDemo
    @Published var navigationPath: [NavigationPath] = []
    @Published var currentMeetingIndex: Int?
    @Published var currentStatusIndex: Int?
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
}

enum NavigationPath: Hashable {
    case meeting(String)
    case status(String)
}
