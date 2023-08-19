//
//  MeetingViewModel.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 19/08/23.
//

import SwiftUI

class MeetingViewModel: ObservableObject {
    @Published var meeting: Meeting
    weak var delegate: MeetingDelegate?
    
    init(meeting: Meeting, delegate: MeetingDelegate?) {
        self.meeting = meeting
        self.delegate = delegate
        print("MeetingViewModel.init")
    }
    
    deinit {
        print("MeetingViewModel.deinit")
    }
    
    func backButtonTapped() {
        delegate?.didEndEditing(meeting: meeting)
    }
}

extension MeetingViewModel: StatusDelegate {
    func didEndEditing(status: DailyStatus) {
        print("MeetingViewModel.didEndEditing")
        if let statusIndex = meeting.statuses.firstIndex(where: { existingStatus in
            existingStatus.id == status.id
        }) {
            meeting.statuses[statusIndex] = status
        }
        delegate?.popNavigation()
    }
}

protocol MeetingDelegate: AnyObject {
    func didEndEditing(meeting: Meeting)
    func popNavigation()
}
