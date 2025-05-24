//
//  MapView.swift
//  Flyer
//
//  Created by Noa Witte on 24/05/2025.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    let flyers: [Flyer]
    @State var selectedFlyer: Flyer?
    var body: some View {
        Map(initialPosition: .region(.copenhagen()), selection: $selectedFlyer) {
            ForEach(flyers) { flyer in
                Annotation("", coordinate: flyer.coordinate) {
                    FlyerAnnotation(flyer: flyer)
                }
            }
        }
        .colorScheme(.dark)
        .mapStyle(.style())
    }
}


#Preview {
    MapView(flyers: .mock())
}

private extension MapStyle {
    static func style() -> MapStyle {
        .standard(
            elevation: .realistic,
            emphasis: .automatic,
            pointsOfInterest: .including(
                .museum,
                .theater,
                .musicVenue
            ),
            showsTraffic: false
        )
    }
}

struct FlyerAnnotation: View {
    let flyer: Flyer
    var body: some View {
        Image(flyer.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40)
            .padding(3)
            .background(.foreground)
            .roundedCorners(radius: 4)
    }
}
