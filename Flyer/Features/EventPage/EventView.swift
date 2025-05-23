//
//  EventView.swift
//  Flyer
//
//  Created by Noa Witte on 09/05/2025.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Image(.mayhemFlyer)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(5)
                        .padding(.horizontal, 50)
                }
            }
        }
    }
}

#Preview {
    EventView()
}
