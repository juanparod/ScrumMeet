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
    var currentMeetingViewModel: MeetingViewModel?
    
    deinit {
        print("MeetingsListViewModel.deinit")
    }
    
    func addMeetingButtonTapped() {
        createMeeting()
    }
    
    func createMeeting() {
        let meeting = Meeting(date: Date(), statuses: [])
        meetings.append(meeting)
        navigate(to: meeting)
    }
    
    func navigate(to meeting: Meeting) {
        navigationPath.append(.meeting(meeting))
    }
    
    func popNavigation() {
        print("MeetingsListViewModel.popNavigation")
        navigationPath.removeLast()
    }
}

extension MeetingsListViewModel: MeetingDelegate {
    func didEndEditing(meeting: Meeting) {
        if let meetingIndex = meetings.firstIndex(where: { existingMeeting in
            existingMeeting.id == meeting.id
        }) {
            meetings[meetingIndex] = meeting
        }
        popNavigation()
    }
}

enum NavigationPath: Hashable {
    case meeting(Meeting)
    case status(DailyStatus)
}
