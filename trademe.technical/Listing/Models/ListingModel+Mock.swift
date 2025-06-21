//
//  ListingModel+Mock.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

#if DEBUG

extension ListingModel {
    
    static func makeMockEntries(count: Int) -> [ListingModel] {
        (0..<count).map { _ in
            ListingModel(
                id: Int.random(in: 0..<10000000000),
                title: "A Long multiline mock title which should wrap",
                priceDisplay: "$200",
                buyNowPrice: 201.00,
                isClassified: false,
                thumbnailURL: nil,
                region: "Region String"
            )
        }
    }
}

#endif
