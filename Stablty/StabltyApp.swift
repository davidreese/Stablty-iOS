//
//  StabltyApp.swift
//  Stablty
//
//  Created by David Reese on 5/23/23.
//

import SwiftUI
import FirebaseCore

@main
struct StabltyApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
