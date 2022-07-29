//
//  SignInView.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/11/22.
//

import SwiftUI
import FirebaseAuth


struct SignInView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var signedIn = false
    @State private var signInError = ""

    var body: some View {
        if (signedIn) {
            ContentView()
        }
        if (!signedIn) {
            VStack {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.accentColor)
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                }
                .modifier(customViewModifier(roundedCornes: 6, startColor: .white, endColor: .accentColor, textColor: .black))
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "key")
                        .foregroundColor(.accentColor)
                    SecureField("Password", text: $password)
                        .textInputAutocapitalization(.never)
                }.modifier(customViewModifier(roundedCornes: 6, startColor: .white, endColor: .accentColor, textColor: .black))
                    .padding(.horizontal)
                
                Button {
                    signIn(email: self.email, password: self.password)
                } label: {
                    Image("login")
                }
                .padding()
                .shadow(radius: 3, x: 0, y: 4)
                
            }
            .background(Image("background").scaledToFill()
                .ignoresSafeArea())
            if signInError != "" {
                Text(signInError)
                    .foregroundColor(.red)
            }
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {(result, error) in
            if error != nil {
            print(error?.localizedDescription ?? "")
                self.signInError = error?.localizedDescription ?? ""
            } else {
                print("success")
                signedIn.toggle()
            }
        }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
