//
//  StartView.swift
//  Stablty
//
//  Created by David Reese on 6/2/23.
//

import SwiftUI

struct StartView: View {
    @AppStorage("token") var token: String?
    
    var body: some View {
        if token != nil {
            HomeView()
        } else {
            LoginView()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
