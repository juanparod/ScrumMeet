//
//  MeetingView.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 12/08/23.
//

import SwiftUI

struct MeetingView: View {
    @State var meeting: Meeting
    @State var selectedParticipant: String = ""
    
    var body: some View {
        List {
            Section {
                HStack {
                    DatePicker("Fecha:", selection: $meeting.date)
                }
            }
            Section {
                ForEach(meeting.statuses) { status in
                    NavigationLink(value: status) {
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
        .navigationDestination(for: DailyStatus.self) { status in
            StatusView(status: status)
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MeetingView(
                meeting: Meeting(
                    date: .aug7,
                    statuses: [.demoJP]
                )
            )
        }
    }
}
