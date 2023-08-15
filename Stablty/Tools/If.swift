//
//  If.swift
//  Stablty
//
//  Created by David Reese on 7/12/23.
//

import Foundation
import SwiftUI

/// https://forums.swift.org/t/conditionally-apply-modifier-in-swiftui/32815
extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}
