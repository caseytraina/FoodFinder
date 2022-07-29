//
//  MapView.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/4/22.
//

import SwiftUI
import CoreLocation
import MapKit


//CURRENTLY DOESNT DISPLAY THE JSON ITEMS CORRECTLY HOWEVER IT IS READING THEM CORRECTLY AND IS CREATING THE ARRAY CORRECTLY

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @StateObject var locationViewModel = LocationViewModel()
    @State var isPressed = false
    @ObservedObject var locations: JSONData
    @State var currentPressed: MapLocation = examplePlace
    @State private var index: Int = 0
    
    var body: some View {
        
        ZStack {
            switch locationViewModel.authorizationStatus {
            case .notDetermined:
                AnyView(RequestLocationView())
                    .environmentObject(locationViewModel)
                    .zIndex(1)
            case .restricted:
                ErrorView(errorText: "Location use is restricted.")
            case .denied:
                ErrorView(errorText: "The app does not have location permissions. Please enable them in settings.")
            case .authorizedAlways, .authorizedWhenInUse:
                TrackingView()
                    .environmentObject(locationViewModel)
            default:
                Text("Unexpected status")
            }
            
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: locations.places) { place in

                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.coordinates.latitude, longitude: place.coordinates.longitude)) {
                    MapAnnotationView(type: place.type)
                        .onTapGesture {
                            self.currentPressed = place
                            print(currentPressed.name)
                            self.isPressed.toggle()
                        }
                        .shadow(color: .secondary, radius: 1, x: 0, y: 2)
                }
              }
            .frame(width: screenSize.width, height: screenSize.height)
            .popover(isPresented: $isPressed) {
                MapPopoverView(place: self.$currentPressed)
            }
        }
        .onAppear {
            print(self.locations.places)
        }
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(locations: [examplePlace])
//    }
//}



