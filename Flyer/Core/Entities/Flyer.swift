//
//  Flyer.swift
//  Flyer
//
//  Created by Noa Witte on 23/05/2025.
//

import Foundation
import DeveloperToolsSupport

struct Flyer: Identifiable {
    let id = UUID()
    let image: ImageResource = .randomFlyer
    let events: [Event]
    //    let imageUrl: URL
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
