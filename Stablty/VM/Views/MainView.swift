//
//  MainView.swift
//  Stablty
//
//  Created by David Reese on 5/23/23.
//

import SwiftUI

struct MainView: View {
    
    @State var selection: Int = 0
    
    @State var showTabBar = false
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "StabltyPurple")!]

                //Use this if NavigationBarTitle is with displayMode = .inline
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "StabltyPurple")!]
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(0)
                
                SkillsView()
                    .tabItem {
                        Label {
                            Text("Master a Skill")
                        } icon: {
                            if selection == 1 {
                                ScaledImage(name: "MasterASkillIcon", size: CGSize(width: 43, height: 35))
                            } else {
                                ScaledImage(name: "MasterASkillIconGray", size: CGSize(width: 43, height: 35))
                            }
                        }

                    }
                    .tag(1)
            }
            .overlay {
                if showTabBar {
                    VStack {
                        Spacer()
                        Rectangle()
                            .frame(height: 90)
                            .cornerRadius(StabltyUI.standardCornerRadius)
                            .foregroundColor(.white)
                            .shadow(radius: StabltyUI.shadowRadius)
                            .overlay {
                                HStack {
                                    StabltyTabButton(generalImage: Image(systemName: "house"), chosenImage: Image(systemName: "house.fill"), title: "Home", selection: $selection)
                                        .index(0)
                                }
                            }
                    }.ignoresSafeArea()
                }
            }
        }
    }
    
    /// Custom tab button for switching tabs in a ``TabView``
    struct StabltyTabButton: View {
        let action: (() -> Void)?
        let generalImage: Image
        let chosenImage: Image
        let title: String
        
        var selection: Binding<Int>
        @State var isChosen: Bool = false
        
        /// Creates a standard tab button
        /// - Parameters:
        ///   - action: The action fired when the tab button is chosen after having not been chosen
        ///   - generalImage: Image to show in the button's natural state
        ///   - chosenImage: Image to show in the button's chosen state
        init(action: (() -> Void)? = nil, generalImage: Image, chosenImage: Image, title: String, selection: Binding<Int>) {
            self.action = action
            self.generalImage = generalImage
            self.chosenImage = chosenImage
            self.title = title
            self.selection = selection
        }
        
        var body: some View {
            Button {
                if !isChosen {
                    action?()
                    isChosen = true
                }
            } label: {
                VStack {
                    if isChosen {
                        chosenImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28)
                    } else {
                        generalImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28)
                    }
                    Text(title)
                        .font(Font.custom(Fonts.poppinsLight, size: 9))
                        .bold()
                }
            }
            .overlay {
                if isChosen {
                    Rectangle()
                        .fill(Color.white.opacity(0.01))
                }
            }//.disabled(isChosen)
            .onChange(of: self.selection.wrappedValue) { newValue in
                if newValue == index {
                    isChosen = true
                } else {
                    depress()
                }
            }
        }
        
        /// Indicates to the button that another tab has been chosen and this tab is no longer supposed to be active.
        func depress() {
            if isChosen == true {
                isChosen = false
            }
        }
        
        var index: Int?
        
        func index(_ index: Int) -> some View {
            var stb = StabltyTabButton(generalImage: generalImage, chosenImage: chosenImage, title: title, selection: selection)
            stb.index = index
            if selection.wrappedValue == index {
                stb.isChosen = true
            }
            return stb
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
