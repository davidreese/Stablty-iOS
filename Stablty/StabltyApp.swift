//
//  StabltyApp.swift
//  Stablty
//
//  Created by David Reese on 5/23/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAppCheck
import AuthenticationServices
import FirebaseAuth

@main
struct StabltyApp: App {
    
    init() {
//        App check enabled
        let providerFactory = StabltyAppCheckProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        
        FirebaseApp.configure()
        
        print("Current user at launch: \(Auth.auth().currentUser)")
    }
    
    let startView = StartView()
    
    var body: some Scene {
        WindowGroup {
            startView
        }
    }
}
