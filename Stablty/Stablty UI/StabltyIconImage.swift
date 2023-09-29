//
//  StabltyIconImage.swift
//  Stablty
//
//  Created by David Reese on 9/28/23.
//

import Foundation
import SwiftUI
/*
struct StabltyIconImage: View {
    var name: String
    var size: CGSize
    var isSelected: Binding<Bool>
    
    init(name: String, size: CGSize = .init(width: 30, height: 30), isSelected: Binding<Bool>) {
        self.name = name
        self.size = size
        self.isSelected = isSelected
    }
    
    var body: some View {
        if let uiImage = resizedImage(named: self.name, for: self.size)?.grayscale() {
            return Image(uiImage: uiImage.withRenderingMode(.alwaysOriginal))
        } else {
            return Image(systemName: "questionmark.circle.fill")
        }
    }
    
    func resizedImage(named: String, for size: CGSize) -> UIImage? {
        guard let image = UIImage(named: named) else {
            return nil
        }
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}*/
