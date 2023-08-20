//
//  Status.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 12/08/23.
//

import Foundation

struct DailyStatus: Identifiable, Equatable, Codable {
    var id = UUID().uuidString
    var teamMember: TeamMember
    var yesterday: String
    var today: String
    var blockers: String
    
    init(teamMember: TeamMember, yesterday: String, today: String, blockers: String) {
        self.teamMember = teamMember
        self.yesterday = yesterday
        self.today = today
        self.blockers = blockers
    }
    
    init() {
        self.teamMember = TeamMember(name: "", role: "")
        self.yesterday = ""
        self.today = ""
        self.blockers = ""
    }
}

extension DailyStatus: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension DailyStatus {
    static let demoJP = DailyStatus(
        teamMember: .jp,
        yesterday: "Ayer terminé el ticket PDMI-14943 y creé el pull request",
        today: "Hoy comenzaré a trabajar en el ticket PDMI-15002 y revisaré pull requests",
        blockers: "No me será posible terminar ticket PDMI-15002 hasta que el el equipo de cloud me proporcione el certificado definitivo"
    )
    
    static let demoLuca = DailyStatus(
        teamMember: .luca,
        yesterday: "",
        today: "",
        blockers: ""
    )
    
    static let demoEugenia = DailyStatus(
        teamMember: .eugenia,
        yesterday: "",
        today: "",
        blockers: ""
    )
    
    static let demoAlvaro = DailyStatus(
        teamMember: .alvaro,
        yesterday: "",
        today: "",
        blockers: ""
    )
    
    static let demoEmma = DailyStatus(
        teamMember: .emma,
        yesterday: "",
        today: "",
        blockers: ""
    )
    
    static let demoSamuel = DailyStatus(
        teamMember: .samuel,
        yesterday: "",
        today: "",
        blockers: ""
    )
    
    static let demoLiliana = DailyStatus(
        teamMember: .liliana,
        yesterday: "",
        today: "",
        blockers: ""
    )
}
