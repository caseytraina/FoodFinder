//
//  BusinessSignUpView.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/23/22.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

struct BusinessSignUpView: View {
    
    @State var businessName = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var signedIn = false
    @State var messageShown = false

    var body: some View {
        
        if !signedIn {
                VStack {
                    HStack {
                        Image(systemName: "house")
                            .foregroundColor(.accentColor)
                        TextField("Business Name", text: $businessName)
                            .textInputAutocapitalization(.never)
                    }
                    .modifier(customViewModifier(roundedCornes: 6, startColor: .white, endColor: .accentColor, textColor: .black))
                    .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.accentColor)
                        TextField("Business Email", text: $email)
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

                    Link(destination: URL(string: "https://forms.gle/kTMKUPQcFoRo8DJq5")!) {
                        Image(systemName: "link.circle.fill")
                            .font(.largeTitle)
                        Text("Complete Registration Online")
                    }
                    
                    Button {
                        if password == confirmPassword {
                            if ![businessName, email, password].contains("") {
                            addToDatabase(businessName: self.businessName, email: self.email, password: self.password)
                            createAccount(email: self.email, password: self.password)
                            }
                        }
                        messageShown.toggle()
                    } label: {
                        Image("submit")
                    }
                        .alert("Great! Your request is being reviewed!", isPresented: $messageShown) {
                            Button("OK", role: .cancel) { }
                        }
                        .padding()
                        .shadow(radius: 3, x: 0, y: 4)
            }
            if messageShown {
                Text("Great! Your information has been submitted. Please be sure to fill out the Google Form to complete registration!")
                    .frame(alignment: .center)
            }
        }
        
        if signedIn {
            ContentView()
        }

        
    }
    
    func createAccount(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) {(result, error) in
            if error != nil {
                print("An error occurred while creating your account: \(error?.localizedDescription ?? "")")
            } else {
                print("Account Successfully Created for \(email).")
                signedIn.toggle()
            }
        }
    }
    
    func addToDatabase(businessName: String, email: String, password: String) {

        var ref: DocumentReference? = nil

        do {
            try db.collection("businesses").document(businessName).setData(from: Business(businessName: businessName, email: email))
        } catch let error {
            print("Error writing user to Firestore: \(error)")
        }
    }
}

struct BusinessSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSignUpView()
    }
}
