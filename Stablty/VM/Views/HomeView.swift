//
//  HomeView.swift
//  Stablty
//
//  Created by David Reese on 5/23/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView {
            Text("Welcome. You have arrived.")
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
