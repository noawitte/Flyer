//
//  FrontPageView.swift
//  Flyer
//
//  Created by Noa Witte on 09/05/2025.
//

import SwiftUI

struct FrontPageView: View {
    
    let flyers: [Flyer]
    
    static let spacing: CGFloat = 3
    
    let columns = Array(
        repeating: GridItem(
            .flexible(minimum: 100),
            spacing: Self.spacing,
            alignment: .center
        ),
        count: 3
    )
    
    @State var controlBarSize: CGSize = .zero
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: Self.spacing, pinnedViews: .sectionHeaders) {
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
            .padding(.bottom, controlBarSize.height + 10)
        }
        .scrollIndicators(.hidden)
        .overlay(content: {
            VStack {
                Spacer()
                HStack {
                    // Not same heights because of different symbols
                    ControlBar(controls: .leadingControl)
                    Spacer()
                    ControlBar(controls: .centerControls)
                    Spacer()
                    ControlBar(controls: .trailingControl)
                }
                .readSize(to: $controlBarSize)
                .padding(.horizontal, 10)
            }
        })
    }
}

#Preview {
    FrontPageView(flyers: .mock())
}
