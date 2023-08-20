//
//  AppDelegate.swift
//  ScrumMeet
//
//  Created by Juan Pablo Rodriguez on 19/08/23.
//

import Firebase
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Configure Firebase
        FirebaseApp.configure()
        return true
    }
}
