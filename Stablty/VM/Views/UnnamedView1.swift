//
//  UnnamedView1.swift
//  Stablty
//
//  Created by David Reese on 8/21/23.
//

import SwiftUI

struct UnnamedView1: ProgressiveView {
    var continueButtonView: (Continue)?
    
    var id: ObjectIdentifier
    
//    var onProgressRequest: (() -> Void)?
    
    var content: StabltyContent
    
    @State var requestedMoveOn: Bool = false
//    @Binding var requestedMoveOnBinding: Bool = Binding {
//        <#code#>
//    } set: { <#Value#> in
//        <#code#>
//    }


    
    init(content: StabltyContent) {
        self.content = content
        self.id = .init(content)
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                content.mainImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height/2)
                    .cornerRadius(StabltyUI.standardCornerRadius, corners: [.bottomLeft, .bottomRight])
                    .shadow(radius: StabltyUI.shadowRadius)
                    
                VStack {
                    HStack {
                        Text(content.title)
                            .font(Font.custom(Fonts.poppinsMedium, size: 18))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    
                    Blur(style: .dark)
                        .cornerRadius(StabltyUI.standardCornerRadius)
                        .overlay {
                            Text("Content not available yet")
                                .foregroundColor(.white)
                        }
                    
                    continueButtonView
                }.padding()
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
            .background(.clear)
//            .background(
//                    Image("Background1")
//                        .resizable()
//                        .ignoresSafeArea()
//                )
        }
    }
    
}

struct UnnamedView1_Previews: PreviewProvider {
    static var previews: some View {
        UnnamedView1(content: StabltyContent(title: "Test", mainImage: Image("Filler1")))
    }
}
