//
//  FlyerCardView.swift
//  Flyer
//
//  Created by Noa Witte on 09/05/2025.
//

import SwiftUI

struct FlyerCardView: View {
    let image: ImageResource
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .roundedCorners(radius: 3)
                .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    FlyerCardView(image: .mayhemFlyer1)
}
