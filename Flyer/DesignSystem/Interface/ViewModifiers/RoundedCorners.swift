//
//  RoundedCorners.swift
//  Flyer
//
//  Created by Noa Witte on 23/05/2025.
//

import SwiftUI

extension View {
    func roundedCorners(radius: CGFloat? = nil) -> some View {
        modifier(RoundedCorners(radius: radius))
    }
}

struct RoundedCorners: ViewModifier {
    let radius: CGFloat?
    @State var size: CGSize = .zero
    func body(content: Content) -> some View {
        content
            .readSize(to: $size)
//            .frame(minWidth: size.height)
            .mask {
                RoundedRectangle(cornerRadius: radius ?? size.height / 2)
            }
    }
    
    
}
