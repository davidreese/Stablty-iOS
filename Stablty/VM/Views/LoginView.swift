//
//  LoginView.swift
//  Stablty
//
//  Created by David Reese on 5/29/23.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth

struct LoginView: View {
    @StateObject private var model: LoginModel = LoginModel()
    @AppStorage("token") var token: String?
    @AppStorage("rawNonce") var rawNonce: String?
    
    var body: some View {
        SignInWithAppleButton(.continue) { authRequest in
            authRequest.requestedScopes = [.fullName, .email]
            let rawNonce = randomNonceString()
            authRequest.nonce = sha256(rawNonce)
            self.rawNonce = rawNonce
        } onCompletion: { result in
            switch result {
                case .success(let authorization):
                
                guard let nonce = rawNonce else {
                  fatalError("Invalid state: A login callback was received, but no login request was sent.")
                }
                
                guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential, let identityToken = appleIDCredential.identityToken else {
                    print("Unable to fetch data")
                    return
                }
                
//                let userId = appleIDCredential.user
//                let authCode = appleIDCredential.authorizationCode
//                let email = appleIDCredential.email
//                let givenName = appleIDCredential.fullName?.givenName
//                let familyName = appleIDCredential.fullName?.familyName
                print("Real User Status: \(appleIDCredential.realUserStatus)")

                
//                Leaving out state unless that will be implemented
//                    let state = appleIDCredential.state
                
                guard let idTokenString = String(data: identityToken, encoding: .utf8) else {
                  print("Unable to serialize token string from data: \(identityToken.debugDescription)")
                  return
                }
                
                guard verify(appleIdToken: idTokenString) else {
                    return
                }
                
                
                
                /*
                 Note from the dev. license agreement:
                 If a Sign in with Apple user has chosen to anonymize their user data as part of Sign In with Apple, You agree not to attempt to link such anonymized data with information that directly identifies the individual and that is obtained outside of Sign In with Apple without first obtaining user consent.
                 */
                
                let credential = OAuthProvider.appleCredential(withIDToken: idTokenString, rawNonce: nonce, fullName: appleIDCredential.fullName)
                
                      // Sign in with Firebase.
                Auth.auth().signIn(with: credential) { (authResult, error) in
                        if let error {
                          // Error. If error.code == .MissingOrInvalidNonce, make sure
                          // you're sending the SHA256-hashed nonce as a hex string with
                          // your request to Apple.
                          print("Couldn't sign in with Firebase: \(error.localizedDescription)")
                          return
                        }
                        // User is signed in to Firebase with Apple.
                          
                          self.token = idTokenString
                      }
                
                    break
                case .failure(let error):
                
                    break
            }
        }
        .scaledToFit()
    }
    
    /// Returns `true` if the apple id token meets specifications.
    /// - Note: Token specifications can be found [here](https://developer.apple.com/documentation/sign_in_with_apple/sign_in_with_apple_rest_api/verifying_a_user).
    func verify(appleIdToken: String) -> Bool {
        let json = decode(jwtToken: appleIdToken)
        /*
        json
    https://developer.apple.com/documentation/sign_in_with_apple/sign_in_with_apple_rest_api/verifying_a_user
    https://developer.apple.com/forums/thread/708415*/
        
        return true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
