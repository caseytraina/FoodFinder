//
//  MapLocationStruct.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/3/22.
//
    
import Foundation
import CoreLocation

struct MapLocation: Identifiable, Codable {
    var id: Int
    var name: String
    var phoneNumber: String
    var website: String
    var latitude: Double
    var longitude: Double
    var type: String
    var bio: String
    var imageURL: String
    var address: String
    var coordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    var requirements: [String]
    var hours: [String : String]
//
//    {
////        CLLocationCoordinate2D(latitude: getCoo, longitude: longitude)
//        var block: (CLLocationCoordinate2D, NSError?) -> Void
//        let address = "1 Infinite Loop, CA, USA"
//        let geocoder = CLGeocoder()
//
//        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
//           if((error) != nil){
//              print("Error", error)
//           }
//           if let placemark = placemarks?.first {
//              let coords:CLLocationCoordinate2D = placemark.location!.coordinate
//              }
//            })
//
//        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
//
////        getCoordinate(addressString: self.address, completionHandler: block)
//
//
//
//
//
//    }
    
}

class JSONData: ObservableObject {
    @Published var places: [MapLocation] = []
}

class LocationManager : ObservableObject {
    @Published var location : CLLocationCoordinate2D?
    
    func convertAddress(address: String) {
        getCoordinate(addressString: address) { (location, error) in
            if error != nil {
                //handle error
                return
            }
            DispatchQueue.main.async {
                self.location = location
            }
        }
    }
    
    private func getCoordinate(addressString : String,
            completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                        
                    completionHandler(location.coordinate, nil)
                    return
                }
            }
                
            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }
}
