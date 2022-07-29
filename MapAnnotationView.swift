//
//  MapAnnotationView.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/3/22.
//

import Foundation
import SwiftUI

struct MapAnnotationView: View {
    
    var type: String
    
      var body: some View {
          VStack(spacing: 0) {
              if type=="Food Pantry" {
                  
                  Image(systemName: "fork.knife.circle.fill")
                    .font(.title)
                    .imageScale(.large)
                    .foregroundStyle(.white,.red)
                  Image(systemName: "arrowtriangle.down.fill")
                    .font(.caption)
                    .foregroundColor(.red)
                    .offset(x: 0, y: -5)
                  
              } else if type == "Overnight Shelter" {
                  
                  Image(systemName: "bed.double.circle.fill")
                    .font(.title)
                    .foregroundStyle(.white, .blue)
                    .imageScale(.large)
                  Image(systemName: "arrowtriangle.down.fill")
                    .font(.caption)
                    .foregroundColor(.blue)
                    .offset(x: 0, y: -5)
                  
              } else if type == "Soup Kitchen" {
                  
                  Image(systemName: "house.circle.fill")
                    .font(.title)
                    .foregroundStyle(.white, .green)
                    .imageScale(.large)
                  Image(systemName: "arrowtriangle.down.fill")
                    .font(.caption)
                    .foregroundColor(.green)
                    .offset(x: 0, y: -5)
              } else {
                  Image(systemName: "house.circle.fill")
                    .font(.title)
                    .foregroundStyle(.white, .purple)
                    .imageScale(.large)
                  Image(systemName: "arrowtriangle.down.fill")
                    .font(.caption)
                    .foregroundColor(.purple)
                    .offset(x: 0, y: -5)
              }
          }
      }
}
