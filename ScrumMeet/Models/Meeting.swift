//
//  Meeting.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 12/08/23.
//

import Foundation

struct Meeting: Identifiable, Equatable, Codable {
    var id = UUID().uuidString
    var date: Date
    var statuses: [DailyStatus]
    
    init(date: Date, statuses: [DailyStatus]) {
        self.date = date
        self.statuses = statuses
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.date = try container.decode(Date.self, forKey: .date)
        self.statuses = try container.decodeIfPresent([DailyStatus].self, forKey: .statuses) ?? []
    }
    
    init() {
        self.date = Date()
        self.statuses = []
    }
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
