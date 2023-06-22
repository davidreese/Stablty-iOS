//
//  SettingsView.swift
//  Stablty
//
//  Created by David Reese on 6/6/23.
//

import SwiftUI
import FirebaseAuth
import _AuthenticationServices_SwiftUI

struct SettingsView: View {
    @AppStorage("token") var token: String?
    
    @StateObject private var model = SettingsModel()
    
    @State private var isPresentingDeleteAccountConfirmation: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Account") {
                    Button("Logout") {
                        model.logout()
                    }
                    Button(role: .destructive) {
                        isPresentingDeleteAccountConfirmation = true
                    } label: {
                        Text("Delete Account")
                    }
                    .alert("Account Deletion", isPresented: $isPresentingDeleteAccountConfirmation, actions: {
                        Button("Delete", role: .destructive) {
                            model.startDeleteAccountFlow()
                        }
                    }, message: {
                        //TODO: Confirm this line is true
                        Text("Are you sure you want to delete your account? This action cannot be done, and you will lose future paid access to Stablty.")
                    })
                    .alert(isPresented: $model.isPresentingAuthError, error: model.authError, actions: { _ in
                        Button("Cancel", role: .cancel) {
                            model.isPresentingAuthError = false
                            
                            model.authError = nil
                        }
                        Button("Reauthenticate") {
                            model.logout()
                            
                            model.authError = nil
                        }
                    }) { authError in
                        Text(authError.recoverySuggestion ?? "")
                    }
                }
                
            }
            .navigationTitle("Settings")
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
