//
//  MKCoordinateRegion.swift
//  Flyer
//
//  Created by Noa Witte on 24/05/2025.
//

import MapKit
import SwiftUI

extension MKCoordinateRegion {
    static func copenhagen() -> MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: CLLocationDegrees(55.671357),
                longitude: CLLocationDegrees(12.590912)
            ),
            span: MKCoordinateSpan(
                latitudeDelta: CLLocationDegrees(0.02),
                longitudeDelta: CLLocationDegrees(0.02)
            )
        )
    }

    func randomCoordinate() -> CLLocationCoordinate2D {
        let latMin = center.latitude - span.latitudeDelta / 2
        let latMax = center.latitude + span.latitudeDelta / 2
        let lonMin = center.longitude - span.longitudeDelta / 2
        let lonMax = center.longitude + span.longitudeDelta / 2

        let randomLat = Double.random(in: latMin...latMax)
        let randomLon = Double.random(in: lonMin...lonMax)

        return CLLocationCoordinate2D(latitude: randomLat, longitude: randomLon)
    }
}
