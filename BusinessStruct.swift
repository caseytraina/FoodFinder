//
//  BusinessStruct.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/23/22.
//

import Foundation
import CoreLocation

public struct Business: Codable {

    let businessName: String?
    let email: String?

    enum CodingKeys: String, CodingKey {
        case businessName
        case email
    }

}

public struct CompleteBusiness: Codable, Identifiable {

    public let id = UUID()
    let businessName: String?
    let email: String?
    let image: String?
    let hours: [String? : String?]
    let bio: String?
    let typeOfService: String?
    let genderRestrictions: String?
    let vetRestrictions: String?
    let otherRestrictions: String?
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipCode: String?
    let password: String?
    
    enum CodingKeys: String, CodingKey {
        case businessName
        case email
        case image
        case hours
        case bio
        case typeOfService
        case genderRestrictions
        case vetRestrictions
        case otherRestrictions
        case streetAddress
        case city
        case state
        case zipCode
        case password
    }


    
}

class AllBusinesses: ObservableObject {
    @Published var businesses: [CompleteBusiness] = []
}

//func convertAddress(business: CompleteBusiness) -> [Double, Double] {
//    let address = "\(String(describing: business.streetAddress)), \(business.city), \(business.state) \(business.zipCode)"
//
//    let geoCoder = CLGeocoder()
//    geoCoder.geocodeAddressString(address) { (placemarks, error) in
//        guard
//            let placemarks = placemarks,
//            let location = placemarks.first?.location?.coordinate
//        else {
//            return CLLocationCoordinate2D(latitude: 0, longitude: 0)
//        }
//        return location
//    }
//}

