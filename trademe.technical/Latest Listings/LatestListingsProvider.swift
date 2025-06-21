//
//  LatestListingProvider.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import Foundation

struct LatestListingProvider: ListingsProvider {
    
    private let fetcher: ListingsFetcher
    
    init(fetcher: ListingsFetcher) {
        self.fetcher = fetcher
    }
    
    func getListings(count: Int) async throws -> [ListingModel] {
        let responseListings = try await self.fetcher.fetchListings(with: [.rows(count), .sortOrder(.expiryDesc)])
        let listings = responseListings.List.map({ ListingModel(from: $0) })
        
        return listings
    }
}
