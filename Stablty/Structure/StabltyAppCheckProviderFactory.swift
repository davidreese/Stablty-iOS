//
//  YourSimpleAppCheckProviderFactory.swift
//  Stablty
//
//  Created by David Reese on 5/24/23.
//

import Foundation
import Firebase
import FirebaseAppCheck

class StabltyAppCheckProviderFactory: NSObject, AppCheckProviderFactory {
  func createProvider(with app: FirebaseApp) -> AppCheckProvider? {
    return AppAttestProvider(app: app)
  }
}
