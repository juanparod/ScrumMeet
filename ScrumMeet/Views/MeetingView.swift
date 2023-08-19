//
//  MeetingView.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 12/08/23.
//

import SwiftUI

struct MeetingView: View {
    @ObservedObject var viewModel: MeetingViewModel
    @State var selectedParticipant: String = ""
    
    var body: some View {
        let _ = Self._printChanges()
        List {
            Section {
                HStack {
                    DatePicker("Fecha:", selection: $viewModel.meeting.date)
                }
            }
            Section {
                ForEach(viewModel.meeting.statuses) { status in
                    NavigationLink(value: NavigationPath.status(status)) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(status.teamMember.name)
                            Text(status.teamMember.role)
                                .font(.caption)
                        }
                    }
                }
                Button("Agregar estatus") {}
            } header: {
                HStack {
                    Image(systemName: "person.3.fill")
                    Text("Participantes")
                }
            }

        }
        .navigationTitle("Junta")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    viewModel.backButtonTapped()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Juntas")
                    }
                }
            }
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MeetingView(
                viewModel: .init(
                    meeting: Meeting(
                        date: .aug7,
                        statuses: [.demoJP]
                    ),
                    delegate: nil
                )
            )
        }
    }
}
