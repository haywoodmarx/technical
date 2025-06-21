//
//  ListingsProvider+Mock.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

#if DEBUG

struct MockListingsProvider: ListingsProvider {
    
    private let mockListings: [ListingModel]
    
    init(providing listings: [ListingModel] = []) {
        self.mockListings = listings
    }
    
    func getListings(count: Int) async throws -> [ListingModel] {
        return Array(mockListings.prefix(count))
    }
}

extension ListingsProvider where Self == MockListingsProvider {
    
    static func withMockEntries() -> MockListingsProvider {
        return .init(providing: ListingModel.makeMockEntries(count: 20))
    }
    
    static func withNoEntries() -> MockListingsProvider {
        return .init()
    }
}

#endif
