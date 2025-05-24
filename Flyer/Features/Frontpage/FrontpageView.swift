//
//  FrontPageView.swift
//  Flyer
//
//  Created by Noa Witte on 09/05/2025.
//

import SwiftUI

struct FrontPageView: View {
    let flyers: [Flyer]
    
    @Namespace private var flyerGrid
    @Environment(ControlBarSettings.self)
    private var controlBarSettings: ControlBarSettings
    private let columns = Array(repeating: gridItem, count: 3)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading, spacing: Self.gridSpacing, pinnedViews: .sectionHeaders) {
                    Section {
                        ForEach(flyers) { flyer in
                            NavigationLink {
                                FlyerCardView()
                                    .navigationBarBackButtonHidden()
                                    .navigationTransition(
                                        .zoom(
                                            sourceID: flyer.id,
                                            in: flyerGrid
                                        )
                                    )
                            } label: {
                                Image(.mayhemFlyer)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .matchedTransitionSource(id: flyer.id, in: flyerGrid)
                                    .roundedCorners(radius: 2)
                            }
                        }
                    } header: {
                        //                    Text("Ma  yhem")
                    }
                }
                .padding(.bottom, controlBarSettings.height + 10)
            }
            .scrollIndicators(.hidden)
        }
    }
}

extension FrontPageView {
    private static let gridSpacing: CGFloat = 3
    private static let gridItem = GridItem(
        .flexible(minimum: 100),
        spacing: Self.gridSpacing,
        alignment: .center
    )
}

#Preview {
    FrontPageView(flyers: .mock())
        .environment(ControlBarSettings())
}

