//
//  SkillsView.swift
//  Stablty
//
//  Created by David Reese on 9/28/23.
//

import SwiftUI

struct SkillsView: View {
    let skills: [Skill]
    
    init(skills: [Skill]) {
        self.skills = skills
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                RoundedRectangle(cornerRadius: StabltyUI.standardCornerRadius)
                    .foregroundStyle(RadialGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.0, saturation: 0.0, brightness: 0.9506747693900603, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.1, saturation: 0.0, brightness: 1.0, opacity: 1.0), location: 1.0)]), center: UnitPoint.topLeading, startRadius: 132.40559895833334, endRadius: 585.3841145833333))
                    .shadow(color: Color(white: 0.8),radius: 3, x: 2, y: 2)
                    .frame(height: 43)
                    .overlay {
                        HStack {
                            Image("StabltyHead")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding([.trailing, .vertical],5)
                            Text("Welcome to Mindfulness")
                                .font(Font.custom(Fonts.poppinsMedium, size: 16))
                            Spacer()
                        }
                        .padding(.horizontal)
                        .foregroundColor(Color("StabltyPurple"))
                    }
                
//                Spacer()

                ForEach(0..<skills.count, id: \.self) { index in
                    if index % 2 == 0 {
                        HStack {
                            SkillLink(skill: skills[index])
                            Spacer()
                            Spacer()
                            if skills.indices.upperBound > index + 1 {
                                SkillLink(skill: skills[index + 1])
                            }
                        }//.padding(.bottom, 5)
                    }
                }//.listRowSeparator(.hidden)
                
                Spacer()
            }//.listStyle(.plain)
            .padding(.horizontal, 5)
        }
    }
    
    /// Links to a
    struct SkillLink: View {
        private let skill: Skill
        
        init(skill: Skill) {
            self.skill = skill
        }
        
        var body: some View {
            Button(action: {
                
            }) {
                ZStack {
                    skill.mainImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    LinearGradient(colors: [.red, .yellow, .green], startPoint: .leading, endPoint: .topTrailing)
                        .opacity(0.4)
                    
                    Text(skill.title)
                        .font(.title2)
                        .bold()
                        .foregroundStyle(Color.white)
                }
            }
            .frame(height: 100)
            .cornerRadius(StabltyUI.standardCornerRadius)
            .clipped()
//            .overlay {
//                NavigationLink("") {
//                    EmptyView()
//                }
//            }

            
        }
    }
}

struct SkillsView_Previews: PreviewProvider {
    static var previews: some View {
        SkillsView(skills: [])
    }
}
