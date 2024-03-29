//
//  FancySearchBar.swift
//  Stablty
//
//  Created by David Reese on 3/29/24.
//

import SwiftUI

struct FancySearchBar: View {
    @State private(set) var isSearching = false
    
    private let startedSearch: () -> Void
    private let search: (_ text: String) -> Void
    
    init(startedSearch: @escaping () -> Void, search: @escaping (_ text: String) -> Void) {
        self.startedSearch = startedSearch
        self.search = search
    }
    
    var body: some View {
        if !isSearching {
            ZStack {
                Button(action: {
                    startedSearch()
                    withAnimation {
                        isSearching = true
                    }
                }) {
                    GeometryReader { geo in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(AngularGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.665665592055723, saturation: 0.0, brightness: 0.9067559299698796, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.6813464796686748, saturation: 0.11866116810993976, brightness: 1.0, opacity: 1.0), location: 0.804522235576923)]), center: UnitPoint.topLeading, angle: .radians(6.18344144834115)))
                            .shadow(color: .black.opacity(0.1) ,radius: 10, x: geo.size.width - 90, y: 0)
                    }
                }
                HStack {
                    Spacer()
                    Image("StabltyHead")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(8)
                }
            }
        } else {
            SearchBar(search: search)
//            ZStack {
//                    GeometryReader { geo in
//                        RoundedRectangle(cornerRadius: 15)
//                            .fill(.black.opacity(0.03))
//                            .shadow(color: .black.opacity(0.1) ,radius: 10)
//                    }
//            }

        }
    }
}

#Preview {
    FancySearchBar(startedSearch: {}) { text in
        
    }
}
