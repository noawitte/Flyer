//
//  FrontPageView.swift
//  Flyer
//
//  Created by Noa Witte on 09/05/2025.
//

import SwiftUI

struct FrontPageView: View {
    
    let flyers: [Flyer]
    
    let columns = Array(
        repeating: GridItem(
            .flexible(minimum: 100),
            spacing: 5,
            alignment: .center
        ),
        count: 3
    )
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 5, pinnedViews: .sectionHeaders) {
                Section {
                    ForEach(flyers) { flyer in
                        Image(.mayhemFlyer)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                } header: {
//                    Text("Mayhem")
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    FrontPageView(flyers: .mock())
}
