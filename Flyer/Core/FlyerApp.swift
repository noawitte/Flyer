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
    @State var controlBarSettings = ControlBarSettings()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .overlay(content: {
                    VStack {
                        Spacer()
                        ControlBar()
                            .readSize(to: $controlBarSettings.controlBarSize)
                            .padding(.horizontal, 20)
                    }
                })
                .background(.background)
                .environment(client)
                .environment(controlBarSettings)
                .colorScheme(.dark)
        }
    }
}
