//
//  UnnamedView1.swift
//  Stablty
//
//  Created by David Reese on 8/21/23.
//

import SwiftUI

struct UnnamedView1: ProgressiveView {
    
    
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
                    
                Group {
                    HStack {
                        Text("Insert title here")
                            .font(Font.custom(Fonts.poppinsMedium, size: 18))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    
                    Rectangle()
                        .overlay {
                            Text("Unclear how to predict what belongs in this box")
                                .foregroundColor(.white)
                        }
                }.padding()
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
            
            .background(
                    Image("Background1")
                        .resizable()
                        .ignoresSafeArea()
                )
        }
    }
    
}

struct UnnamedView_Previews: PreviewProvider {
    static var previews: some View {
        UnnamedView1(content: StabltyContent(mainImage: Image("Filler1")))
    }
}
