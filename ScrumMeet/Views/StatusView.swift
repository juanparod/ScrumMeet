//
//  StatusView.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 13/08/23.
//

import SwiftUI

struct StatusView: View {
    @State var status: DailyStatus
    @State var teamMember = ""
    private let participants = TeamMember.allTeam
    
    var body: some View {
        VStack {
            Picker("Nombre:", selection: $teamMember) {
                Text("Seleccionar participante")
                ForEach(participants) { participant in
                    Text(participant.name)
                }
            }
            VStack {
                Text("¿Qué hice ayer?")
                    .font(.title)
                    .bold()
                TextEditor(text: $status.yesterday)
                    .multilineTextAlignment(.center)
            }
            VStack {
                Text("¿Qué haré hoy?")
                    .font(.title)
                    .bold()
                TextEditor(text: $status.today)
                    .multilineTextAlignment(.center)
            }
            VStack {
                Text("Bloqueos")
                    .font(.title)
                    .bold()
                TextEditor(text: $status.blockers)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .navigationTitle("Estatus")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StatusView(
                status: .demoJP
            )
        }
    }
}
