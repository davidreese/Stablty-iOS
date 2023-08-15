//
//  HomeView.swift
//  Stablty
//
//  Created by David Reese on 7/12/23.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                face
            }
        } else {
            NavigationView {
                face
            }
        }
        
    }
    
    var face: some View {
        VStack {
            // intoduction bar
            Group {
                RoundedRectangle(cornerRadius: StabltyUI.standardCornerRadius)
                    .foregroundStyle(RadialGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.0, saturation: 0.0, brightness: 0.9506747693900603, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.1, saturation: 0.0, brightness: 1.0, opacity: 1.0), location: 1.0)]), center: UnitPoint.topLeading, startRadius: 132.40559895833334, endRadius: 585.3841145833333))
                    .shadow(color: Color(white: 0.8),radius: 3, x: 2, y: 2)
                    .overlay {
                        HStack {
                            Image(systemName: "questionmark")
                                .padding(.trailing)
                            Text("Introduction to Mindfulness")
                                .font(Font.custom(Fonts.poppinsRegular, size: 16))
                            Spacer()
                        }
                        .padding(.horizontal)
                        .foregroundColor(Color("StabltyPurple"))
                    }
                /*
                 .overlay {
                 HStack {
                 Image(systemName: "questionmark")
                 Spacer()
                 }
                 .padding()
                 .foregroundColor(Color("StabltyPurple"))
                 }
                 */
            }
            .frame(height: 40)
            .padding()
            
            Group {
                HStack {
                    Text("Your Top Picks")
                        .font(Font.custom(Fonts.poppinsMedium, size: 19))
                        .foregroundColor(Color("StabltyPurple"))
                    Spacer()
                }.padding(.horizontal)
                
            }
            
            Spacer()
            
            VStack {
                HStack {
                    Text("Recently Accessed")
                        .font(Font.custom(Fonts.poppinsMedium, size: 19))
                        .foregroundColor(Color("StabltyPurple"))
                    Spacer()
                }.padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer()
                            .frame(width: 16)
                        ForEach(1..<5) { _ in
                            ImageAndTextButton(title: "Title here", description: "Descripion goes here")
                                .frame(width: 175, height: 100)
                        }
                        Spacer()
                            .frame(width: 16)
                    }
                }
            }
            
            Spacer()
        }
        .navigationTitle("Home")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image("StabltyHead")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                //                        .background(.red)
                    .aspectRatio(contentMode: .fit)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "line.3.horizontal")
                }
            }
        }
    }
    
    struct StabltyFoyer: View {
        
        var body: some View {
            VStack {
                HStack {
                    Text("Home")
                        .font(Font.custom(Fonts.poppinsBold, size: 26))
                        .foregroundColor(Color("StabltyPurple"))
                    //                        .font(.title)
                    Spacer()
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("StabltyHead")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                    //                        .background(.red)
                        .aspectRatio(contentMode: .fit)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
        }
        
        /// Determines the casual name associated with the signed-in user.
        /// - Returns: The casual name
        private func getCasualName() -> String? {
            return Auth.auth().currentUser?.displayName
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
