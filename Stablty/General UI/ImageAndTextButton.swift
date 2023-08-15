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
                    .foregroundStyle(LinearGradient(colors: [Color(red: 26/255, green: 41/255, blue: 128/255), Color(red: 39/255, green: 207/255, blue: 205/255)], startPoint: .leading, endPoint: .trailing))
                    .overlay(
                        HStack {
                            Image("Filler1")
                                .resizable()
                                .aspectRatio(1.0, contentMode: .fill)
                                .shadow(radius: StabltyUI.shadowRadius)
                                .cornerRadius(StabltyUI.standardCornerRadius)
                                .padding([.vertical, .leading], 10)
                                
                            
                            VStack {
                                HStack {
                                    Image("Filler2")
                                        .resizable()
                                        .aspectRatio(1.0, contentMode: .fit)
                                        .frame(width: 10, height: 10)
                                    Spacer()
                                }
                                
                                HStack {
                                    Text(title)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(1)
                                        .font(Font.custom(Fonts.poppinsMedium, size: 9))
                                        .minimumScaleFactor(0.6)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                
                                HStack {
                                Text(description)
                                    .font(Font.custom(Fonts.poppinsLight, size: 6))
                                    .foregroundColor(.white)
                            Spacer()
                        }
                                Spacer()
                            }
                            .padding(.vertical)
                        }
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
