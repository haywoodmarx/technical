//
//  ListingsProvider.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import Foundation

protocol ListingsProvider {
    
    func getListings(count: Int) async throws -> [ListingModel]
}
