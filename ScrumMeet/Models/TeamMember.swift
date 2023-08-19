//
//  TeamMember.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 12/08/23.
//

import Foundation

struct TeamMember: Identifiable, Equatable {
    var name: String
    var role: String
    
    var id: String {
        name
    }
}

extension TeamMember {
    static let jp = TeamMember(name: "Juan Pablo Rodríguez", role: "Sr Staff Software Engineer")
    static let samuel = TeamMember(name: "Samuel Medina", role: "Software Engineer")
    static let alvaro = TeamMember(name: "Álvaro Cárdenas", role: "Sr Test Engineer")
    static let eugenia = TeamMember(name: "Eugenia García", role: "Test Enginner")
    static let luca = TeamMember(name: "Luca Reynoso", role: "Sr Software Engineer")
    static let liliana = TeamMember(name: "Liliana Padilla", role: "Sr Test Engineer")
    static let emma = TeamMember(name: "Emma Piñón", role: "Software Engineer")
    static let allTeam: [TeamMember] = [.jp, .samuel, .alvaro, .eugenia, .luca, .liliana, .emma]
}
