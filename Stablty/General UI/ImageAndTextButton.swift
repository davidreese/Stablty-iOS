//
//  ImageAndTextButton.swift
//  Stablty
//
//  Created by David Reese on 8/15/23.
//

import SwiftUI

struct ImageAndTextButton: View {
    var title: String
    var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    var body: some View {
        Button(action: {}) {
            ZStack {
                RoundedRectangle(cornerRadius: StabltyUI.standardCornerRadius)
                    .foregroundStyle(LinearGradient(colors: [Color(red: 32/255, green: 94/255, blue: 155/255), Color(red: 33/255, green: 184/255, blue: 195/255)], startPoint: .leading, endPoint: .trailing))
                    .overlay(
                        HStack {
                            Image("Filler1")
                                .resizable()
                                .aspectRatio(1.0, contentMode: .fill)
                                .shadow(radius: StabltyUI.shadowRadius)
                                .cornerRadius(StabltyUI.standardCornerRadius)
                                
                            VStack {
                                HStack {
                                    Image("Filler2")
                                        .resizable()
                                        .aspectRatio(1.0, contentMode: .fit)
                                        .frame(width: 17.5, height: 17.5)
                                    Spacer()
                                }
                                
                                HStack {
                                    Text(title)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(1)
                                        .font(Font.custom(Fonts.poppinsMedium, size: 15.75))
                                        .minimumScaleFactor(0.6)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                
                                HStack {
                                Text(description)
                                        .font(Font.custom(Fonts.poppinsLight, size: 10.5))
                                    .foregroundColor(.white)
                            Spacer()
                        }
                                Spacer()
                            }
                        }.padding(20)
//                            .padding(.horizontal)
                    )
                
                
            }
        }
    }
}

struct ImageAndTextButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageAndTextButton(title: "Title", description: "Description")
    }
}
