//
//  HomeUIView.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/4/22.
//

import SwiftUI
import CoreLocation
import FirebaseAuth

struct HomeUIView: View {
    @State var swiped = false
    @ObservedObject var users: AllUsers
    
    var user = Auth.auth().currentUser
    @State var showingAlert = false
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button("Sign Out") {
                        let firebaseAuth = Auth.auth()
                        do {
                            try firebaseAuth.signOut()
                            showingAlert.toggle()
                        } catch let signOutError as NSError {
                            print("Error signing out: %@", signOutError)
                        }
                    }
                    .padding()
                    .alert("Please close app for the sign out to take effect!", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    Spacer()
                }
                HStack {
                    Image(systemName: "location.circle")
                        .padding(.vertical)
                        .foregroundColor(.black)
                    Text("Food Finder!")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.vertical)
                }
            }
            .padding(.top, 40.0)
            .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .secondary, radius: 3, x: 0, y: 3))
            .frame(width: screenSize.width, alignment: .center)
            .ignoresSafeArea()
            
            
            Spacer()

                VStack {
                    Capsule()
                        .fill(Color.secondary)
                        .frame(width: 30, height: 3)
                        .padding(5)
                    Text("Welcome Back, \(findMe().firstName ?? "")")
                        .font(.headline)
                        .frame(width: screenSize.width)
                        .foregroundColor(.accentColor)
                    Text("Tap a location to get started")
                        .font(.subheadline)
                        .padding(.bottom, 40)
                }
                .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(color: .secondary, radius: 3, x: 0, y: -3))
                .frame(width: screenSize.width, alignment: .center)
                .ignoresSafeArea()
//                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
//                                .onEnded({ value in
//                                    if value.translation.height < 0 {
//                                        swiped.toggle()
//                                    }
//                                }))
//                .popover(isPresented: $swiped) {
//                Text("Text")
//            }
        }

    }
    
    private func findMe() -> User {
        for i in users.users {
            if i.email?.lowercased() == self.user?.email {
                return User(firstName: i.firstName, lastName: i.lastName, email: i.email, password: i.password)
            }
        }
        return User(firstName: "", lastName: "", email: "", password: "")
        
    }
}

//struct HomeUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeUIView()
//    }
//}
