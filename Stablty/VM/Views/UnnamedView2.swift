//
//  UnnamedView2.swift
//  Stablty
//
//  Created by David Reese on 3/29/24.
//

import SwiftUI

struct UnnamedView2: View {
    @State private var startedSearch = false
    
    var body: some View {
        VStack {
            HStack {
                if !startedSearch {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .bold()
                            .foregroundColor(.gray)
                            .imageScale(.large)
                    }.padding(7)
                }
                
                //not sure what the next thing is supposed to do
                FancySearchBar(startedSearch: {
                    withAnimation {
                        self.startedSearch = true
                    }
                }, search: { text in
                })
            }.frame(height: 50)
            
            Spacer().frame(height: 30)
            
            if !startedSearch {
                VStack {
                    HStack {
                        Text("Topic 1")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(Color("StabltyPurple"))
                        Spacer()
                    }
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(AngularGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.665665592055723, saturation: 0.20361328125000003, brightness: 0.9067559299698796, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.6014771978539157, saturation: 0.5699918815888555, brightness: 1.0, opacity: 1.0), location: 0.804522235576923)]), center: UnitPoint.topLeading, angle: .radians(6.18344144834115)))
                    
                    Spacer().frame(height: 30)
                    
                    HStack {
                        Text("Topic 1")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(Color("StabltyPurple"))
                        Spacer()
                    }
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(AngularGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.9999676440135543, saturation: 0.20361328125000003, brightness: 0.9067559299698796, opacity: 1.0), location: 0.0710712139423077), Gradient.Stop(color: Color(hue: 0.9977527296686748, saturation: 0.8294192394578314, brightness: 1.0, opacity: 1.0), location: 0.804522235576923)]), center: UnitPoint.topLeading, angle: .radians(5.4745929269590565)))
                }
            } else {
                ScrollView {
                    
                }
            }
        }.padding()
        //.searchable(text: $searchText)
    }
}

struct UnnamedView2_Previews: PreviewProvider {
    static var previews: some View {
        UnnamedView2()
    }
}
