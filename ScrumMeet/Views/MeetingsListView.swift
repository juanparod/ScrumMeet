//
//  MeetingsView.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 12/08/23.
//

import SwiftUI

struct MeetingsListView: View {
    @EnvironmentObject var viewModel: MeetingsListViewModel
    
    init() {
        print("MeetingsListView.init")
    }
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            List {
                ForEach(viewModel.meetings) { meeting in
                    NavigationLink(value: NavigationPath.meeting(meeting.id)) {
                        Text(meeting.date.customFormat())
                    }
                }
                .onDelete { indexSet in
                    viewModel.deleteMeeting(at: indexSet)
                }
            }
            .navigationDestination(for: NavigationPath.self) { path in
                switch path {
                case let .meeting(id):
                    MeetingView(id: id)
                case let .status(id):
                    StatusView(id: id)
                }
            }
            .navigationTitle("Juntas diarias")
            .toolbar {
                Button {
                    viewModel.addMeetingButtonTapped()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .onAppear {
            viewModel.onViewAppear()
        }
    }
}

struct MeetingsListView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingsListView()
    }
}
