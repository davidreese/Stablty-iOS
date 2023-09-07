//
//  ProgressionView.swift
//  Stablty
//
//  Created by David Reese on 8/23/23.
//

import SwiftUI

/*
struct ProgressionView: View {
    @State private var views: [ProgressiveView]
    @State private var index = 0
    
    init(views: [ProgressiveView]) {
        self.views = views
    }
    
    var body: some View {
        let prelimView = views[index]
            
        if let view = prelimView as? UnnamedView1 {
            view
                .onChange(of: view.requestedMoveOn) { newValue in
                    if newValue == true {
                        index += 1
                        view.requestedMoveOn = false
                    }
                }
        } else {
            Text("?")
        }
    }
    
    func next() {
        index += 1
    }
}

struct ProgressionView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressionView(views: [])
    }
}
*/
