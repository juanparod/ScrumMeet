//
//  MeetingView.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 12/08/23.
//

import SwiftUI

struct MeetingView: View {
    @EnvironmentObject var viewModel: MeetingsListViewModel
    @State var selectedParticipant: String = ""
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    var body: some View {
        let _ = Self._printChanges()
        List {
            Section {
                HStack {
                    DatePicker("Fecha:", selection: $viewModel.currentMeeting.date)
                }
            }
            Section {
                ForEach(viewModel.currentMeeting.statuses) { status in
                    NavigationLink(value: NavigationPath.status(status.id)) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(status.teamMember.name)
                            Text(status.teamMember.role)
                                .font(.caption)
                        }
                    }
                }
                Button("Agregar estatus") {
                    viewModel.addStatusButtonTapped()
                }
            } header: {
                HStack {
                    Image(systemName: "person.3.fill")
                    Text("Participantes")
                }
            }

        }
        .navigationTitle("Junta")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.setMeeting(for: id)
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MeetingView(id: Meeting.listDemo[0].id)
        }
    }
}
