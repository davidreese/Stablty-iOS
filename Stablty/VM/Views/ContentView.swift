//
//  ContentView.swift
//  Stablty
//
//  Created by David Reese on 5/23/23.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "StabltyPurple")!]

                //Use this if NavigationBarTitle is with displayMode = .inline
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "StabltyPurple")!]
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
