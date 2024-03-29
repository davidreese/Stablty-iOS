//
//  UnnamedView2.swift
//  Stablty
//
//  Created by David Reese on 3/29/24.
//

import SwiftUI

struct UnnamedView2: View {
//    @State private var searchText = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "line.3.horizontal")
                        .bold()
                        .foregroundColor(.gray)
                        .imageScale(.large)
                }.padding(7)
                
                //not sure what the next thing is supposed to do
                ZStack {
                    GeometryReader { geo in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(AngularGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.665665592055723, saturation: 0.0, brightness: 0.9067559299698796, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.6813464796686748, saturation: 0.11866116810993976, brightness: 1.0, opacity: 1.0), location: 0.804522235576923)]), center: UnitPoint.topLeading, angle: .radians(6.18344144834115)))
                            .shadow(color: .black.opacity(0.1) ,radius: 10, x: geo.size.width - 90, y: 0)
                    }
                    HStack {
                        Spacer()
                        Image("StabltyHead")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(8)
                    }
                }
            }.frame(height: 50)
            
            Spacer().frame(height: 30)
            
            HStack {
                Text("Topic 1")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color("StabltyPurple"))
                Spacer()
            }
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            
            Spacer().frame(height: 30)

            HStack {
                Text("Topic 1")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color("StabltyPurple"))
                Spacer()
            }
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        }.padding()
        //.searchable(text: $searchText)
    }
}

struct UnnamedView2_Previews: PreviewProvider {
    static var previews: some View {
        UnnamedView2()
    }
}
