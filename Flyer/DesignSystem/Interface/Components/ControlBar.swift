//
//  ControlBar.swift
//  Flyer
//
//  Created by Noa Witte on 23/05/2025.
//

import SwiftUI

struct ControlBar: View {
    let controls: [String]
    
    var singleControl: Bool {
        controls.count == 1
    }
    
    var buttonHorizontalPadding: CGFloat {
        singleControl ? 0 : 5
    }
    
    var body: some View {
        HStack {
            ForEach(controls, id: \.self) { image in
                ControlButton(image: image)
                    .padding(.horizontal, buttonHorizontalPadding)
                    .padding(10)
            }
        }
        .background(.thinMaterial)
        .roundedCorners()
        .tint(.white)
    }
}

#Preview {
    FrontPageView(flyers: .mock())
}

extension [String] {
    static let leadingControl = [
        "arrow.up.arrow.down"
    ]
    
    static let centerControls: [String] = [
        "heart",
        "magnifyingglass",
        "square.stack.3d.up"
    ]
    
    static let trailingControl = [
//        "rectangle.grid.3x2.fill"
        "map.fill"
    ]
}

struct ControlButton: View {
    let image: String
    @State var size: CGSize = .zero
    var body: some View {
        Button {

        } label: {
            Image(systemName: image)
                .fontWeight(.semibold)
                .readSize(to: $size)
                .frame(width: size.height)
        }
    }
}

enum Control {
    case search, sort, favorites, map, category
}

enum Category {
    case music, art, theater, market
}
