//
//  GetStartedView.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/22/22.
//

import SwiftUI

struct GetStartedView: View {
    
    @State private var signingIn = false
    @State private var creatingAccount = false
    @State private var businessOwner = false

    var body: some View {
        
        if !signingIn {
            if !creatingAccount {
                if !businessOwner {
                    VStack {
                        Image("frontPage")
                            .padding()
                        Spacer()
                        Button {
                            creatingAccount.toggle()
                        } label: {
                            Image("getStarted")
                        }
                        .shadow(radius:2, y: 4)
                        Button {
                            signingIn.toggle()
                        } label: {
                            Text("Already have an account? Sign in now!")
                                .font(.custom("Avenir Next", size: 18))
                                .bold()
                                .shadow(radius: 2, y: 2)
                        }
                        .padding()
                        Button {
                            businessOwner.toggle()
                        } label: {
                            Text("Business owner? Register here!")
                                .font(.custom("Avenir Next", size: 18))
                                .bold()
                                .shadow(radius: 2, y: 2)
                        }
                    }
                    .background(Image("background").scaledToFill()
                        .ignoresSafeArea()
                    )
                }
            }
        }
        
        if businessOwner {
            BusinessSignUpView()
        }
        
        if signingIn {
            SignInView()
        }
        if creatingAccount {
            CreateAccountView()
        }
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
