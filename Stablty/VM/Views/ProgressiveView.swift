//
//  ProgressiveView.swift
//  Stablty
//
//  Created by David Reese on 8/24/23.
//


 import SwiftUI
 
protocol ProgressiveView: View, Identifiable, Animatable {
    associatedtype Continue = AnyView
    
    var continueButtonView: (Continue)? { get set }
//    var onProgressRequest: (() -> Void)? { get }
//     var content: Content
 
//     func onProgressRequest(_ action: @escaping () -> Void) -> any ProgressiveView
 }
 
extension View where Self: ProgressiveView {
    func setContinueButton(_ continueButtonView: Self.Continue) -> some View {
        var newView = self
        newView.continueButtonView = continueButtonView
        return newView
    }
}
