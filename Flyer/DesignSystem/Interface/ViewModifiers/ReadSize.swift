//
//  ReadSize.swift
//  Flyer
//
//  Created by Noa Witte on 23/05/2025.
//

import SwiftUI

extension View {
    func readSize(to size: Binding<CGSize>) -> some View {
        modifier(ReadSize(size: size))
    }
}

struct ReadSize: ViewModifier {
    @Binding var size: CGSize
    func body(content: Content) -> some View {
        content
            .background {
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            size = proxy.size
                        }
                        .onChange(of: proxy.size) {
                            size = proxy.size
                        }
                }
            }
    }
}
