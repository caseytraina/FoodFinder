//
//  MapPopoverView.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/5/22.
//

import SwiftUI

struct MapPopoverView: View {
    
    @Binding var place: MapLocation
    
    var body: some View {
        VStack {
            Group{
                ZStack {
                    if place.imageURL != "none" {
                    AsyncImage(
                        url: URL(string: place.imageURL), //place.imageUrl
                        content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: screenSize.width, maxHeight: screenSize.width/1.5)
                                 .scaledToFill()
                                 .blur(radius: 5)
                                 .clipShape(Rectangle())
                                 .ignoresSafeArea()
                        },
                        placeholder: {
                            ProgressView()
                                .frame(width: screenSize.width, height: screenSize.width/3, alignment: .center)
                                .contentShape(Rectangle())
                                .progressViewStyle(DarkBlueShadowProgressViewStyle())
                            
                        }
                    )
                    AsyncImage(
                        url: URL(string: place.imageURL), //place.imageUrl
                        content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .clipShape(Circle())
                                 .frame(minWidth:screenSize.width/3, maxWidth: screenSize.width/1.5, maxHeight: screenSize.width/1.5)
                                 .shadow(radius: 2, x: 0, y: 4)
                                 .scaledToFit()
                        },
                        placeholder: {
                            ProgressView()
                                .frame(width: screenSize.width, height: screenSize.width/3, alignment: .center)
                                .contentShape(Rectangle())
                                .progressViewStyle(DarkBlueShadowProgressViewStyle())

                        }
                    )
                    } else if place.imageURL == "none" {
                        Image("emptyImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: screenSize.width)
                            .scaledToFill()
                            .blur(radius: 5)
                            .ignoresSafeArea()
                            .clipShape(Rectangle())
                        Image("emptyImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .scaledToFit()
                            .frame(maxWidth: screenSize.width/1.5, maxHeight: screenSize.width/1.5)
                            .shadow(radius: 2, x: 0, y: 4)
                    }
                }
                HStack {
                    Label {
                        Text(place.name)
                            .bold()
                    } icon: {
                        Image("house")
                    }
                    .ignoresSafeArea()
                    .labelStyle(MainLabelStyle(textSize: 28))
                    Spacer()
                }
                HStack {
                    Label {
                        Text(place.type) //type
                            .bold()
                    } icon: {
                        Image("house")
                    }
                    .ignoresSafeArea()
                    .labelStyle(MainLabelStyle(textSize: 14))
                    Spacer()
                }
                Button {
                    openMapForPlace(latitude: place.latitude, longitude: place.longitude)
                } label: {
                    Image("getDirections")
                }
                Link(destination: URL(string: "https://\(place.website)")!) {
                    Image("website")
                }
            }
            ScrollView {
            
            HStack {
                Label {
                    Text("biography") //type
                        .bold()
                } icon: {
                    Image(systemName: "pencil.circle")
                }
                .labelStyle(MainLabelStyle(textSize: 14))
                Spacer()
            }
            Label {
                Text(place.bio)
            } icon: {
                Image(systemName: "none")
            }
            .labelStyle(MainLabelStyle(textSize: 14))
            .ignoresSafeArea()
            
            HStack {
                Label {
                    Text("restrictions") //type
                        .bold()
                } icon: {
                    Image(systemName: "exclamationmark.octagon")
                }
                .labelStyle(MainLabelStyle(textSize: 14))
                Spacer()
            }
            Label {
                VStack {
                    ForEach(0..<place.requirements.count) { i in
                        HStack {
                            Image(systemName: "hand.point.right")
                            Text(place.requirements[i])
                        }
                    }
                }
            } icon: {
                Image(systemName: "none")
            }
            .labelStyle(MainLabelStyle(textSize: 14))
            .ignoresSafeArea()
            
            HStack {
                Label {
                    Text("address") //type
                        .bold()
                } icon: {
                    Image(systemName: "mappin.circle")
                }
                .labelStyle(MainLabelStyle(textSize: 14))
                Spacer()
            }
            Label {
                Text(place.address)
            } icon: {
                Image(systemName: "none")
            }
            .labelStyle(MainLabelStyle(textSize: 14))
            .ignoresSafeArea()
            
            HStack {
                Label {
                    Text("hours") //type
                        .bold()
                } icon: {
                    Image(systemName: "list.bullet.circle")
                }
                .labelStyle(MainLabelStyle(textSize: 14))
                Spacer()
            }
            Label {
                
                VStack {
                    ForEach(0..<place.hours.count) { i in
                        Text("\(Array(place.hours)[i].key) : \(place.hours[Array(place.hours)[i].key]?.description ?? "closed")")
                    }
                }
            } icon: {
                Image(systemName: "none")
            }
            .labelStyle(MainLabelStyle(textSize: 14))
            .ignoresSafeArea()
            
            Spacer()
            }
        }
    }
}

//struct MapPopoverView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapPopoverView(place: MapL)
//    }
//}
