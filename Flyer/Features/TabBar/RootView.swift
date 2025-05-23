//
//  RootView.swift
//  Flyer
//
//  Created by Noa Witte on 09/05/2025.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        FrontPageView(flyers: .mock())
    }
}

#Preview {
    RootView()
}
