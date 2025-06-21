//
//  LatestListingsView+ViewModel.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import Foundation

extension LatestListingsView {
    
    @MainActor class ViewModel: ObservableObject {
        
        private static let desiredListingsCount: Int = 20
        
        @Published var showAlertDialog: Bool = false
        
        @Published var requiredAlertDialog: SimpleAlertContent? {
            didSet { showAlertDialog = true }
        }
        
        @Published private(set) var listings: [ListingModel] = []
        
        private let listingsProvider: ListingsProvider
        
        private var listingsHandlerTask: Task<Void, Error>?
        
        init(listingsProvider: ListingsProvider) {
            self.listingsProvider = listingsProvider
            
            self.listingsHandlerTask = Task {
                try await self.updateListings()
            }
        }
        
        func updateListings() async throws {
            self.listings = try await listingsProvider.getListings(count: ViewModel.desiredListingsCount)
        }
        
        func searchTapped() {
            self.requiredAlertDialog = .init(
                message: "Selected the search navigation action"
            )
        }
        
        func cartTapped() {
            self.requiredAlertDialog = .init(
                message: "Selected the cart navigation action"
            )
        }
        
        func listingTapped(_ listing: ListingModel) {
            self.requiredAlertDialog = .init(
                message: "Selected \(listing.title)"
            )
        }
        
        deinit {
            listingsHandlerTask?.cancel()
        }
    }
}
