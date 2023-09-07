//
//  Stablty.swift
//  Stablty
//
//  Created by David Reese on 8/23/23.
//

import Foundation
import SwiftUI

class Category {
    var mainImage: Image
    
    var content: [StabltyContent]
    
    internal init(mainImage: Image, content: [StabltyContent]) {
        self.mainImage = mainImage
        self.content = content
    }
}

class StabltyContent {
    var title: String
    var mainImage: Image
    
    init(title: String, mainImage: Image) {
        self.title = title
        self.mainImage = mainImage
    }
}
