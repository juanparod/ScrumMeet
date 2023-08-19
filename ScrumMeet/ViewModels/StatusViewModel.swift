//
//  StatusViewModel.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 19/08/23.
//

import SwiftUI

class StatusViewModel: ObservableObject {
    @Published var status: DailyStatus
    weak var delegate: StatusDelegate?
    
    init(status: DailyStatus, delegate: StatusDelegate?) {
        self.status = status
        self.delegate = delegate
        print("StatusViewModel.delegate = \(String(describing: self.delegate))")
    }
    
    func backButtonTapped() {
        print("StatusViewModel.backButtonTapped | delegate: \(String(describing: delegate))")
        delegate?.didEndEditing(status: status)
    }
}

protocol StatusDelegate: AnyObject {
    func didEndEditing(status: DailyStatus)
}
