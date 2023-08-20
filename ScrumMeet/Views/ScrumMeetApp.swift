//
//  ScrumMeetApp.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 12/08/23.
//

import SwiftUI

@main
struct ScrumMeetApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MeetingsListViewModel())
                .environment(\.locale, Locale(identifier: "es_MX"))
        }
    }
}
