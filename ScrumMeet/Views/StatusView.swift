//
//  StatusView.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 13/08/23.
//

import SwiftUI

struct StatusView: View {
    @ObservedObject var viewModel: StatusViewModel
    private let participants = TeamMember.allTeam
    
    var body: some View {
        VStack {
            Picker("Nombre:", selection: $viewModel.status.teamMember) {
                Text("Seleccionar participante")
                ForEach(participants) { participant in
                    Text(participant.name)
                        .tag(participant)
                }
            }
            VStack {
                Text("¿Qué hice ayer?")
                    .font(.title)
                    .bold()
                TextEditor(text: $viewModel.status.yesterday)
                    .multilineTextAlignment(.center)
            }
            VStack {
                Text("¿Qué haré hoy?")
                    .font(.title)
                    .bold()
                TextEditor(text: $viewModel.status.today)
                    .multilineTextAlignment(.center)
            }
            VStack {
                Text("Bloqueos")
                    .font(.title)
                    .bold()
                TextEditor(text: $viewModel.status.blockers)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .navigationTitle("Estatus")
        .navigationBarTitleDisplayMode(.inline)
        //.navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    viewModel.backButtonTapped()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Junta")
                    }
                }
            }
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StatusView(
                viewModel: .init(
                    status: .demoJP,
                    delegate: nil
                )
            )
        }
    }
}
