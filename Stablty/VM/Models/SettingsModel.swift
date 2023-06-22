//
//  SettingsModel.swift
//  Stablty
//
//  Created by David Reese on 6/6/23.
//

import Foundation
import AuthenticationServices
import FirebaseAuth

class SettingsModel: NSObject, ObservableObject, ASAuthorizationControllerDelegate {
//    var currentNonce: String?
    
    @Published var authError: AuthenticationError?
    @Published var isPresentingAuthError: Bool = false
    
    func showError(_ authError: AuthenticationError) {
        self.authError = authError
        isPresentingAuthError = true
    }
    
    func startDeleteAccountFlow() {
        
        let nonce = randomNonceString()
        UserDefaults.standard.set(nonce, forKey: "rawNonce")
          let appleIDProvider = ASAuthorizationAppleIDProvider()
          let request = appleIDProvider.createRequest()
          request.requestedScopes = [.fullName, .email]
          request.nonce = sha256(nonce)

          let authorizationController = ASAuthorizationController(authorizationRequests: [request])
          authorizationController.delegate = self
          authorizationController.performRequests()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        guard let nonce = UserDefaults.standard.string(forKey: "rawNonce") else {
          fatalError("Invalid state: A login callback was received, but no login request was sent.")
        }
        
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            print("Unable to fetch data")
            return
        }
        
        do {
            try deleteCurrentAccount(appleIDCredential: appleIDCredential)
        } catch AuthenticationError.tokenNotFound {
            showError(AuthenticationError.tokenNotFound)
            return
        } catch AuthenticationError.nonceNotFound {
            showError(AuthenticationError.nonceNotFound)
            return
        } catch {
            print("Failed to delete current account: \(error)")
            return
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        
    }
    
    /// Verifies the given token and then fully deletes the current account.
    private func deleteCurrentAccount(appleIDCredential: ASAuthorizationAppleIDCredential) throws {
        print("Starting to delete current account...")
        
        guard let currentUser = Auth.auth().currentUser else {
            throw AuthenticationError.userNotFound
        }
        
        guard let rawNonce = UserDefaults.standard.string(forKey: "rawNonce") else {
            throw AuthenticationError.nonceNotFound
        }
        
        guard let identityToken = appleIDCredential.identityToken else {
            print("Unable to fetch data")
            return
        }
        
        guard let idTokenString = String(data: identityToken, encoding: .utf8) else {
          print("Unable to serialize token string from data: \(identityToken.debugDescription)")
          return
        }
        
        let credential = OAuthProvider.credential(
          withProviderID: "apple.com",
          idToken: idTokenString,
          rawNonce: rawNonce
        )
        // Reauthenticate current Apple user with fresh Apple credential.
        currentUser.reauthenticate(with: credential) { (authResult, error) in
          guard error == nil else {
              print("Failed to reauthenticate: \(error!)")
              self.logout()
              print("Logged out user. Account was not deleted.")
              return
          }
            
            guard let _ = UserDefaults.standard.string(forKey: "rawNonce") else {
                return
            }
            
          // Apple user successfully re-authenticated.
            print("Successfuly reauthenticated with firebase.")

//            revoking tokens
            
            guard let appleAuthCode = appleIDCredential.authorizationCode else {
                print("Unable to fetch authorization code")
                return
              }

              guard let authCodeString = String(data: appleAuthCode, encoding: .utf8) else {
                print("Unable to serialize auth code string from data: \(appleAuthCode.debugDescription)")
                return
              }
            
            Task {
                do {
                  try await Auth.auth().revokeToken(withAuthorizationCode: authCodeString)
                    self.logout()
                    
                    
                    print("Deleting user from firebase... (UID=\(currentUser.uid))")
                    try await currentUser.delete()
                    UserDefaults.standard.set(nil, forKey: "token")
                    UserDefaults.standard.set(nil, forKey: "rawNonce")
                    print("User successfully deleted")
                    
//                  self.updateUI()
                } catch {
                  print("Error executing account deletion: \(error)")
                }
              }
        }
    }
    
    func logout() {
        print("Logging out user... (UID=\(Auth.auth().currentUser?.uid ?? "nil"))")
        
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.set(nil, forKey: "token")
            UserDefaults.standard.set(nil, forKey: "rawNonce")
            
            print("Succesfully logged out user.")
        } catch {
            print("Failed to sign out: \(error)")
        }
    }
}
