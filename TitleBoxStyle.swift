//
//  TitleBoxStyle.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/4/22.
//

import SwiftUI

struct TitleBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .font(.system(size: 40.0))
//                .font(.system(size: 40.0))
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
