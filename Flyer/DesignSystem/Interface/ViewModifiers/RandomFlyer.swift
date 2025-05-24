//
//  RandomFlyer.swift
//  Flyer
//
//  Created by Noa Witte on 24/05/2025.
//

import SwiftUI

extension ImageResource {
    static var randomFlyer: ImageResource {
        let flyers: [ImageResource] = [.mayhemFlyer1, .mayhemFlyer2, .mayhemFlyer3]
        return flyers.randomElement() ?? .mayhemFlyer1
    }
}
