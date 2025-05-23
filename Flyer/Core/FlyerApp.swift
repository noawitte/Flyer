//
//  FlyerApp.swift
//  Flyer
//
//  Created by Noa Witte on 09/05/2025.
//

import SwiftUI
import SwiftData

@main
struct FlyerApp: App {
    @State private var client = Client()

    var body: some Scene {
        WindowGroup {
            RootView()
                .background(.background)
                .environment(client)
                .colorScheme(.dark)
        }
    }
}
