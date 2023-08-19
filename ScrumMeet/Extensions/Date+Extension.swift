//
//  Date+Extension.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 13/08/23.
//

import Foundation

extension Date {
    static func date(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute)
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func customFormat() -> String {
        return self.formatted(
            Date.FormatStyle()
                .weekday(.wide)
                .day()
                .month()
                .year()
                .hour()
                .minute()
                .locale(Locale(identifier: "es_MX"))
        )
    }
}

extension Date {
    static let aug7 = Date.date(year: 2023, month: 8, day: 7, hour: 10, minute: 40)
    static let aug8 = Date.date(year: 2023, month: 8, day: 8, hour: 10, minute: 40)
    static let aug9 = Date.date(year: 2023, month: 8, day: 9, hour: 10, minute: 40)
    static let aug10 = Date.date(year: 2023, month: 8, day: 10, hour: 10, minute: 40)
    static let aug11 = Date.date(year: 2023, month: 8, day: 11, hour: 10, minute: 40)
}
