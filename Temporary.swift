//
//  Temporary.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/26/22.
//

import SwiftUI

struct Temporary: View {
    var url = "https://www.preblestreet.org/wp-content/uploads/2020/03/soup_kitchen-1.jpg"
    var restrictons = ["Photo ID", "San Francisco Resident", "Cannot be inebriated", "Be Nice!"]
    var address = "128 2nd Street, San Francisco CA 94105"
    var hours = [
        "monday" : "5PM-5PM",
        "tuesday" : "2PM-5PM",
        "wednesday" : "5PM-5PM",
        "thursday" : "closed",
        "friday" : "5PM-9PM",
        "saturday" : "5PM-5PM",
        "sunday" : "closed",
    ]
    
    var body: some View {
        VStack {
            Group{
                ZStack {
                    AsyncImage(
                        url: URL(string: url), //place.imageUrl
                        content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: screenSize.width)
                                 .scaledToFill()
                                 .blur(radius: 5)
                                 .ignoresSafeArea()
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    AsyncImage(
                        url: URL(string: url), //place.imageUrl
                        content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .clipShape(Circle())
                                 .scaledToFit()
                                 .frame(maxWidth: screenSize.width/1.5)
                                 .shadow(radius: 2, x: 0, y: 4)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }
                HStack {
                    Label {
                        Text("Phil's Soup Kitchen")
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
                        Text("Soup Kitchen") //type
                            .bold()
                    } icon: {
                        Image("house")
                    }
                    .ignoresSafeArea()
                    .labelStyle(MainLabelStyle(textSize: 14))
                    Spacer()
                }
                Button {
                    print("Get")
                } label: {
                    Image("getDirections")
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
                Text("Phil’s was first established in 1965. The longest running soup kitchen in San Francisco, Phil’s has long been a source of nourishment and refuge for those in need. Our mission to help spread empathy through the city one warm plate at a team. Come check us out—All are welcome!")
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
                    ForEach(0..<restrictons.count) { i in
                        HStack {
                            Image(systemName: "hand.point.right")
                            Text(restrictons[i])
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
                Text(address)
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
                    ForEach(0..<hours.count) { i in
                        Text("\(Array(hours)[i].key) : \(hours[Array(hours)[i].key]?.description ?? "closed")")
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

struct Temporary_Previews: PreviewProvider {
    static var previews: some View {
        Temporary()
    }
}



