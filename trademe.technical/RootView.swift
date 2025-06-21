//
//  RootView.swift
//  test.app.alpha
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var discoverViewModel: LatestListingsView.ViewModel
    
    init(discoverViewModel: LatestListingsView.ViewModel) {
        self._discoverViewModel = StateObject(wrappedValue: discoverViewModel)
    }
    
    var body: some View {
        TabView {
            LatestListingsView(viewModel: discoverViewModel)
                .tabItem {
                    Label("Latest listings", image: "search")
                }
            
            PlaceHolderView(label: "Watchlist")
                .tabItem {
                    Label("Watchlist", image: "watchlist")
                }
            
            PlaceHolderView(label: "My Trade Me")
                .tabItem {
                    Label("My Trade Me", image: "profile")
                }
        }
    }
}

#Preview {
    RootView(discoverViewModel: .init(listingsProvider: .withMockEntries()))
}
