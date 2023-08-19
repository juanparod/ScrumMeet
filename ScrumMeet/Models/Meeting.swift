//
//  Meeting.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 12/08/23.
//

import Foundation

struct Meeting: Identifiable, Equatable {
    let id = UUID().uuidString
    var date: Date
    var statuses: [DailyStatus]
}

extension Meeting: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
