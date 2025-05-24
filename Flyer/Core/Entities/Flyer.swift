//
//  Flyer.swift
//  Flyer
//
//  Created by Noa Witte on 23/05/2025.
//

import Foundation
import MapKit
import DeveloperToolsSupport

struct Flyer: Identifiable {
    let id = UUID()
    let image: ImageResource = .randomFlyer
    let events: [Event]
    let coordinate: CLLocationCoordinate2D = MKCoordinateRegion.copenhagen().randomCoordinate()
    //    let imageUrl: URL
}

extension Flyer: Equatable, Hashable {
    static func ==(lhs: Flyer, rhs: Flyer) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Flyer {
    static func mock() -> Self {
        Flyer(events: [.mock()])
    }
}

extension [Flyer] {
    static func mock() -> Self {
        (0...20).map({ _ in .mock() })
    }
}
