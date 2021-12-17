//
//  InstagramApp.swift
//  Instagram
//
//  Created by Nawfaldo on 24/06/21.
//

import SwiftUI
import Firebase

@main
struct InstagramApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}

