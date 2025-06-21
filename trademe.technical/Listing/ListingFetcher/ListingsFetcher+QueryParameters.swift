//
//  ListingsFetcher+QueryParameters.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import Foundation

extension ListingsFetcher {
    
    /// Represents parameters to be provided as part of a query to the [Retrieve Latest Listings API](https://developer.trademe.co.nz/api-reference/listing-methods/retrieve-latest-listings)
    enum QueryParameters {
        
        enum SortOrder: String {
            
            /// Sort by expiry date (newest listings).
            case expiryDesc = "ExpiryDesc"
        }
        
        /// The desired sort order of the fetched results
        case sortOrder(SortOrder)
        
        /// The desired number of rows to fetch
        case rows(Int)
    }
}

extension Collection where Element == ListingsFetcher.QueryParameters {
    
    /// Convenience function for converting a collection of query parameters to the corresponding `URLQueryItem` objects.
    func asQueryParameters() -> [URLQueryItem] {
        self.map { queryParameter in
            switch queryParameter {
            case .sortOrder(let order): .init(name: "sort_order", value: order.rawValue)
            case .rows(let count): .init(name: "rows", value: "\(count)")
            }
        }
    }
}
