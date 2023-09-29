//
//  DescribedImageButton.swift
//  Stablty
//
//  Created by David Reese on 8/16/23.
//

import SwiftUI

struct DescribedImageNavigationLink<Content: ProgressiveView>: View {
    let tabs: [Content]
    @State var tabSelection: Int = 0
    
    let tabCount: Int
    
    var title: String
    var description: String
    
    init(tabs: [Content], title: String, description: String) {
        self.tabs = tabs
        self.title = title
        self.description = description
//        self.tabSelection = tabs.first?.id
        self.tabCount = tabs.count
    }
    
    var body: some View {
//        GeometryReader { geo in
        VStack(spacing: 0) {
                NavigationLink {
                    TabView(selection: $tabSelection) {
                        ForEach(tabs.indices) { index in
                            if index < tabs.count - 1 {
                                tabs[index]
                                    .setContinueButton(
                                        AnyView(
                                            HStack {
                                                Spacer()
                                                Button {
                                                    withAnimation {
                                                        self.tabSelection += 1
                                                    }
                                                } label: {
                                                    Text("Continue")
                                                        .font(Font.custom(Fonts.poppinsLight, size: 14))
                                                    Image(systemName: "arrow.right.circle")
                                                }
                                                .padding(.horizontal)
                                                .buttonStyle(.borderedProminent)
                                            }
                                                ) as! Content.Continue)
                                    .tag(index)
                            } else {
                                tabs[index]
                                    .tag(index)
                            }
                                
//                                .overlay {
//                                    if tabSelection < tabs.count - 1 {
//                                        VStack {
//                                            Spacer()
//                                            HStack {
//                                                Spacer()
//                                                Button {
//                                                    withAnimation {
//                                                        self.tabSelection += 1
//                                                    }
//                                                } label: {
//                                                    Text("Continue")
//                                                        .font(Font.custom(Fonts.poppinsLight, size: 14))
//                                                    Image(systemName: "arrow.right.circle")
//                                                }
//                                                .padding(.horizontal)
//                                                .buttonStyle(.borderedProminent)
//                                            }
//                                        }
//                                    }
//                                }
                        }
                        
                        
                        /*tabs()
                            .overlay {
                                Button {
                                    tabSelection += 1
                                } label: {
                                    Text("Plus")
                                }

                            }*/
                    }
                    .animation(.default, value: tabSelection)
                    .background(
                        Image("Background1")
                            .resizable()
                            .ignoresSafeArea()
                    )
                    .ignoresSafeArea(.container)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .background(.black)
                } label: {
                    RoundedRectangle(cornerRadius: StabltyUI.standardCornerRadius)
                        .background(.clear)
                        .aspectRatio(1.0, contentMode: .fit)
                }
                .shadow(radius: 4)
                .padding(.vertical, 15)
                .padding(.horizontal, 5)
                
//                Spacer()
                
                HStack {
                    Text(title)
                        .font(Font.custom(Fonts.poppinsMedium, size: 14.4))
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    Text(description)
                        .font(Font.custom(Fonts.poppinsExtraLight, size: 10.8))
                    Spacer()
                }
                .padding(.horizontal)
            }
//        }
    }
}

struct DescribedImageButton_Previews: PreviewProvider {
    static var previews: some View {
        DescribedImageNavigationLink(tabs: [UnnamedView1(content: .init(title: "Test", mainImage: .init("Stablty1")))], title: "Title", description: "Description")
    }
}
