//
//  StatusView.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 13/08/23.
//

import SwiftUI

struct StatusView: View {
    @EnvironmentObject var viewModel: MeetingsListViewModel
    private let participants = TeamMember.allTeam
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    var body: some View {
        VStack {
            Picker("Nombre:", selection: $viewModel.currentStatus.teamMember) {
                Text("Seleccionar participante")
                    .tag(TeamMember())
                ForEach(participants) { participant in
                    Text(participant.name)
                        .tag(participant)
                }
            }
            VStack {
                Text("¿Qué hice ayer?")
                    .font(.title)
                    .bold()
                TextEditor(text: $viewModel.currentStatus.yesterday)
                    .multilineTextAlignment(.center)
            }
            VStack {
                Text("¿Qué haré hoy?")
                    .font(.title)
                    .bold()
                TextEditor(text: $viewModel.currentStatus.today)
                    .multilineTextAlignment(.center)
            }
            VStack {
                Text("Bloqueos")
                    .font(.title)
                    .bold()
                TextEditor(text: $viewModel.currentStatus.blockers)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .navigationTitle("Estatus")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.setStatus(for: id)
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StatusView(id: DailyStatus.demoJP.id)
        }
    }
}
