//
//  Venue.swift
//  Flyer
//
//  Created by Noa Witte on 23/05/2025.
//

import Foundation

struct Venue {
    let name: String
    let flyers: [Flyer]
    let address: String
    let coordinate: String
}

extension Venue {
    static func mock() -> Venue {
        Venue(
            name: "Mayhem",
            flyers: Array(repeating: 0, count: 20).map({ _ in Flyer.mock() }),
            address: "Ragnhildvej 1",
            coordinate: "12, 55"
        )
    }
}
