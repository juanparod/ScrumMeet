//
//  MeetingsView.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 12/08/23.
//

import SwiftUI

struct MeetingsListView: View {
    @State var meetings = [
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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(meetings) { meeting in
                    NavigationLink(
                        meeting.date.customFormat(),
                        value: meeting
                    )
                }
            }
            .navigationDestination(for: Meeting.self) { meeting in
                MeetingView(
                    meeting: meeting
                )
            }
            .navigationTitle("Juntas diarias")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
    }
}

struct MeetingsListView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingsListView()
    }
}
