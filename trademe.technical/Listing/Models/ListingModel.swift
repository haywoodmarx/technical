//
//  ListingModel.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import Foundation

struct ListingModel: Identifiable, Hashable {
    let id: Int
    let title: String
    let priceDisplay: String
    let buyNowPrice: Decimal?
    let isClassified: Bool
    let thumbnailURL: URL?
    let region: String
}
