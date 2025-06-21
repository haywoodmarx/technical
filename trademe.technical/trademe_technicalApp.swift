//
//  trademe_technicalApp.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import SwiftUI

@main
struct trademe_technicalApp: App {
    var body: some Scene {
        WindowGroup {
            let listingsFetcher = ListingsFetcher(authenticationProvider: .devAuthenticationProvider, baseURL: .devTradeMeBaseURL)
            let listingsProvider = LatestListingProvider(fetcher: listingsFetcher)
            
            RootView(discoverViewModel: .init(listingsProvider: listingsProvider))
        }
    }
}

extension URL {
    
    static let devTradeMeBaseURL = URL(string: "https://api.tmsandbox.co.nz")!
}
