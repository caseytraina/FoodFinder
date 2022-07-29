//
//  ContentView.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/3/22.
//

import SwiftUI
import CoreData
import MapKit
import CoreLocation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift


var examplePlace = MapLocation(id: 1, name: "Now", phoneNumber: "food", website: "660 California St, San Francisco, CA 94108", latitude: 37.0582, longitude: -122.405730, type: "https://example.com/icon.png", bio: "", imageURL: "", address: "", requirements: ["None"], hours: ["":""])

let screenSize: CGRect = UIScreen.main.bounds
let db = Firestore.firestore()

//var locations: [MapLocation] = []

struct ContentView: View {
//    @State var currentPressed: MapLocation
    @StateObject var locations = JSONData()
    @State var currentUser = Auth.auth().currentUser
    @StateObject var users = AllUsers()
    @StateObject var businesses = AllBusinesses()

    var body: some View {
        
        if (currentUser != nil) {
            ZStack {
                MapView(locations: self.locations)
                HomeUIView(users: users)
            }
            .onAppear {
                readFile()
                initUsers()
//                initBusinesses()
                print(self.locations)
            }
        }
        if (currentUser == nil) {
            GetStartedView()
        }
    }
    
    private func readFile() {
        do {
            if let path = Bundle.main.path(forResource: "exampleFile", ofType: "json"), let jsonData = try String(contentsOfFile: path).data(using: .utf8) {

                let decodedData = try JSONDecoder().decode([MapLocation].self, from: jsonData)

                locations.places = decodedData
                
                print("worked")
                print("GOT IT")
                
                print(locations.places)
            }
        } catch {
            print(error)
            print("SOLD")
            print("error")
        }
    }
    
    private func initBusinesses() {
        db.collection("businesses").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting businesses: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let map = document.data()
                    businesses.businesses.append(
                        CompleteBusiness(
                            businessName: map["businessName"] as? String,
                            email: map["email"] as? String,
                            image: map["image"] as? String,
                            hours: map["hours"] as! [String : String],
                            bio: map["bio"] as? String,
                            typeOfService: map["typeOfService"] as? String,
                            genderRestrictions: map["genderRestrictions"] as? String,
                            vetRestrictions: map["vetRestrictions"] as? String,
                            otherRestrictions: map["otherRestrictions"] as? String,
                            streetAddress: map["streetAddress"] as? String,
                            city: map["city"] as? String,
                            state: map["state"] as? String,
                            zipCode: map["zipCode"] as? String,
                            password: map["password"] as? String))
                }
            }
        }
        print("HERE")
    }
    
    private func initUsers() {
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting users: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let map = document.data()
    //                print("\(document.documentID) => \(document.data())")
                    users.users.append(
                        User(firstName: map["firstName"] as? String , lastName: map["lastName"] as? String, email: map["email"] as? String, password: map["password"] as? String))
                    
                }
            }
        }
        print("HERE")

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


