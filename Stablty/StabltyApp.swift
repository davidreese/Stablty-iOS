//
//  StabltyApp.swift
//  Stablty
//
//  Created by David Reese on 5/23/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAppCheck

@main
struct StabltyApp: App {
    
    init() {
//        App check enabled
        let providerFactory = StabltyAppCheckProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
