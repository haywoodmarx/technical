//
//  ListingsFetcher+Response.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import Foundation

extension ListingsFetcher {
    
    struct Response: Decodable {
        let TotalCount: Int
        let Page: Int
        let PageSize: Int
        let List: [Listing]
    }
}

extension ListingsFetcher.Response {
    
    struct Listing: Decodable {
        let ListingId: Int
        let Title: String
        let PriceDisplay: String
        let BuyNowPrice: Decimal?
        let IsClassified: Bool?
        let PictureHref: URL?
        let Region: String
    }
}

extension ListingModel {
    
    /// Convenience initialiser for creating a ``ListingModel`` from a ``ListingsFetcher/Response/Listing``
    /// - Parameter responseListing: The response listing to convert to a model.
    init(from responseListing: ListingsFetcher.Response.Listing) {
        self.init(
            id: responseListing.ListingId,
            title: responseListing.Title,
            priceDisplay: responseListing.PriceDisplay,
            buyNowPrice: responseListing.BuyNowPrice,
            isClassified: responseListing.IsClassified == true,
            thumbnailURL: responseListing.PictureHref,
            region: responseListing.Region
        )
    }
}
