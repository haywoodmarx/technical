//
//  BoundedByKeyLines.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import SwiftUI

struct BoundedByKeyLines: ViewModifier {
    
    func body(content: Content) -> some View {
        VStack {
            Divider()
            content
            Divider()
        }
    }
}

extension View {
    
    func boundedByKeyLines() -> some View {
        self.modifier(BoundedByKeyLines())
    }
}
