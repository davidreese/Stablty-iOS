//
//  Errors.swift
//  Stablty
//
//  Created by David Reese on 6/12/23.
//

import Foundation

enum AuthenticationError: LocalizedError {
    
    /// Thrown when the locally stored app token is not found
    case tokenNotFound
    
    /// Thrown when the locally stored nonce is not found
    case nonceNotFound
    
    /// Thrown when the user needs to be signed in and is not
    case userNotFound
    
    var errorDescription: String? {
        return "Authentication Error"
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .tokenNotFound:
            return "Try reauthenticating to refresh your token."
        case .nonceNotFound:
            return "Try reauthenticating to refresh your credentials."
        case .userNotFound:
            return "Try reauthenticating to refresh your credentials."
        }
    }
}
