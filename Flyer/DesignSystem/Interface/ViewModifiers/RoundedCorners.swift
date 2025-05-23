//
//  RoundedCorners.swift
//  Flyer
//
//  Created by Noa Witte on 23/05/2025.
//

import SwiftUI

extension View {
    func roundedCorners() -> some View {
        modifier(RoundedCorners())
    }
}

struct RoundedCorners: ViewModifier {
    @State var size: CGSize = .zero
    func body(content: Content) -> some View {
        content
            .readSize(to: $size)
            .frame(minWidth: size.height)
            .mask {
                RoundedRectangle(cornerRadius: size.height / 2)
            }
    }
    
    
}
