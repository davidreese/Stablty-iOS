//
//  UI.swift
//  Stablty
//
//  Created by David Reese on 7/21/23.
//

import Foundation

struct StabltyUI {
    static let shadowRadius: CGFloat = 8
    static let standardCornerRadius: CGFloat = 12
}

import UIKit
import SwiftUI

/// Source: https://stackoverflow.com/questions/56610957/is-there-a-method-to-blur-a-background-in-swiftui
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}


/// Source: https://stackoverflow.com/questions/56610957/is-there-a-method-to-blur-a-background-in-swiftui
struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
