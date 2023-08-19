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

extension Meeting {
    static let listDemo = [
        Meeting(
            date: .aug7,
            statuses: [
                .demoJP,
                .demoLuca,
                .demoEmma,
                .demoSamuel,
                .demoEugenia,
                .demoLiliana,
                .demoAlvaro
            ]
        ),
        Meeting(date: .aug8, statuses: [.demoLuca]),
        Meeting(date: .aug9, statuses: []),
        Meeting(date: .aug10, statuses: []),
        Meeting(date: .aug11, statuses: [])
    ]
}
