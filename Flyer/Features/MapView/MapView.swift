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
    
    @State private var position: MapCameraPosition = .region(.copenhagen())
    @State private var cameraDistance: CLLocationDistance = 1000
    
    var body: some View {
        Map(position: $position, selection: $selectedFlyer) {
            ForEach(flyers) { flyer in
                Annotation("", coordinate: flyer.coordinate) {
                    FlyerAnnotation(flyer: flyer, distance: cameraDistance)
                }
            }
        }
        .colorScheme(.dark)
        .mapStyle(.style())
        .onMapCameraChange(frequency: .continuous) { context in
            cameraDistance = context.camera.distance
            print(cameraDistance)
        }
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
    let distance: CLLocationDistance

    var body: some View {
        Image(flyer.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size(for: distance))
            .padding(2)
            .background(.foreground)
            .roundedCorners(radius: 2)
    }
    
    func size(for distance: CLLocationDistance) -> CGFloat {
        let minSize: CGFloat = 20
        let maxSize: CGFloat = 100
        let maxDistance: CLLocationDistance = 2000
        let minDistance: CLLocationDistance = 100

        let clampedDistance = max(minDistance, min(maxDistance, distance))
        let normalized = 1 - (clampedDistance - minDistance) / (maxDistance - minDistance)
        return minSize + (maxSize - minSize) * normalized
    }
}
