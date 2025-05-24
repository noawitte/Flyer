//
//  FlyerCardView.swift
//  Flyer
//
//  Created by Noa Witte on 09/05/2025.
//

import SwiftUI

struct FlyerCardView: View {
    var body: some View {
        VStack {
            Image(ImageResource.mayhemFlyer)
                .resizable()
                .roundedCorners(radius: 3)
                .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    FlyerCardView()
}
