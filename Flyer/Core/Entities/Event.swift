//
//  Event.swift
//  Flyer
//
//  Created by Noa Witte on 23/05/2025.
//

import Foundation

struct Event {
    let date: Date
    let coordinate: String
}

extension Event {
    static func mock() -> Self {
        Event(date: .now, coordinate: "12, 55")
    }
}
