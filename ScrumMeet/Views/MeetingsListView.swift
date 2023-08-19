//
//  MeetingsView.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 12/08/23.
//

import SwiftUI

struct MeetingsListView: View {
    @ObservedObject var viewModel = MeetingsListViewModel()
    
    init() {
        print("MeetingsListView.init")
    }
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            List {
                ForEach(viewModel.meetings) { meeting in
                    NavigationLink(value: NavigationPath.meeting(meeting)) {
                        Text(meeting.date.customFormat())
                    }
                }
            }
            .navigationDestination(for: NavigationPath.self) { path in
                switch path {
                case let .meeting(meeting):
                    getMeetingView(for: meeting)
                case let .status(status):
                    StatusView(
                        viewModel: .init(
                            status: status,
                            delegate: viewModel.currentMeetingViewModel
                        )
                    )
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
    }
    
    private func getMeetingView(for meeting: Meeting) -> some View {
        if let vm = viewModel.currentMeetingViewModel {
            vm.meeting = meeting
            return MeetingView(
                viewModel: vm
            )
        } else {
            let vm = MeetingViewModel(
                meeting: meeting,
                delegate: viewModel
            )
            viewModel.currentMeetingViewModel = vm
            return MeetingView(
                viewModel: vm
            )
        }
    }
}

struct MeetingsListView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingsListView()
    }
}
