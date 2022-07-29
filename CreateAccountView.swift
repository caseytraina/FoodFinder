//
//  CreateAccountView.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/11/22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct CreateAccountView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var gender = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State var signedIn = false
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
                    TextField("First Name", text: $firstName)
                        .textInputAutocapitalization(.never)
                }
                .modifier(customViewModifier(roundedCornes: 6, startColor: .white, endColor: .accentColor, textColor: .black))
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.accentColor)
                    TextField("Last name", text: $lastName)
                        .textInputAutocapitalization(.never)
                }
                .modifier(customViewModifier(roundedCornes: 6, startColor: .white, endColor: .accentColor, textColor: .black))
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "envelope")
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
                }
                .modifier(customViewModifier(roundedCornes: 6, startColor: .white, endColor: .accentColor, textColor: .black))
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "key")
                        .foregroundColor(.accentColor)
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textInputAutocapitalization(.never)
                }
                .modifier(customViewModifier(roundedCornes: 6, startColor: .white, endColor: .accentColor, textColor: .black))
                .padding(.horizontal)
                Button {
                    if ![firstName, lastName, password, email].contains("") {
                        addToDatabase(firstName: self.firstName, lastName: self.lastName, email: self.email, password: self.password)
                        createAccount(email: self.email, password: self.password)
                    }
                    } label: {
                    Image("createAccount")
                }
                    .padding()
                    .shadow(radius: 3, x: 0, y: 4)
                if signInError != "" {
                    Text(signInError)
                        .foregroundColor(.red)
                }
            }
            .background(Image("background").ignoresSafeArea()
                .scaledToFill())
        }
        
    }
    func createAccount(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) {(result, error) in
            if error != nil {
                print("An error occurred while creating your account: \(error?.localizedDescription ?? "")")
                self.signInError = error?.localizedDescription ?? ""
            } else {
                print("Account Successfully Created for \(email).")
                signedIn.toggle()
            }
        }
    }
    
    func addToDatabase(firstName: String, lastName: String, email: String, password: String) {
        
        var _: DocumentReference? = nil
        
        do {
            try db.collection("users").document(email).setData(from: User(firstName: firstName, lastName: lastName, email: email, password: password))
        } catch let error {
            print("Error writing user to Firestore: \(error)")
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
