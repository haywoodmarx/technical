//
//  PlaceHolderView.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import SwiftUI

struct PlaceHolderView: View {
    
    let label: String
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Spacer()
                Text(label)
                    .navigationTitle(label)
                    .navigationBarTitleDisplayMode(.inline)
                Spacer()
            }
            .boundedByKeyLines()
        }
    }
}
