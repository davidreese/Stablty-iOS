//
//  SearchBar.swift
//  Stablty
//
//  Created by David Reese on 3/29/24.
//

import SwiftUI

struct SearchBar: View {
    @State var searchText: String = ""
    var search: (_ text: String) -> Void
    
    init(search: @escaping (_ text: String) -> Void) {
        self.search = search
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.gray)
                .opacity(0.1)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("", text: $searchText, onCommit: {
                    search(searchText)
                })
                .placeholder(when: searchText.isEmpty) {
                    Text("Search")
                        .foregroundColor(.secondary)
                }
                .foregroundStyle(Color.primary)
                
                
            }
            .padding(.leading, 13)
            
        }
        .frame(height: 40)
        .cornerRadius(13)
    }
}

//General Source: https://stackoverflow.com/questions/57688242/swiftui-how-to-change-the-placeholder-color-of-the-textfield
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
