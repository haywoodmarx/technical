//
//  LatestListingsView.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import SwiftUI

struct LatestListingsView: View {
    
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.listings) { listing in
                    ListingView(listing: listing) { listing in
                        viewModel.listingTapped(listing)
                    }
                }
                .refreshable {
                    try? await viewModel.updateListings()
                }
                .animation(.default, value: viewModel.listings)
                .listStyle(.plain)
            }
            // MARK: Navigation Bar Customisation
            .navigationTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
            .boundedByKeyLines()
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        viewModel.searchTapped()
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
                ToolbarItem {
                    Button(action: {
                        viewModel.cartTapped()
                    })
                    {
                        Image(systemName: "cart")
                    }
                }
            }
            // MARK: Placeholder Alert
            .alert(
                "Placeholder Alert",
                isPresented: Binding<Bool>(
                    get: { self.viewModel.showAlertDialog },
                    set: { newValue in self.viewModel.showAlertDialog = newValue }
                ),
                presenting: viewModel.requiredAlertDialog
            ) { _ in
                Button("OK") { }
            } message: { details in
                Text(details.message)
            }
        }
    }
}

extension LatestListingsView {
    
    struct ListingView: View {
        
        var listing: ListingModel
        
        var action: @MainActor (ListingModel) -> Void
        
        var body: some View {
            Button(action: {
                action(listing)
            }) {
                HStack(alignment: .center, spacing: 16) {
                    AsyncImage(url: listing.thumbnailURL, content: { image in
                        image.resizable()
                            .listingViewImageStyle()
                    }, placeholder: {
                        Image(systemName: "photo")
                            .listingViewImageStyle()
                            .font(.system(size: 24))
                    })
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(listing.region)
                            .font(.caption)
                            .foregroundColor(.bluffOyster600)
                        Text(listing.title)
                            .fontWeight(.medium)
                            .foregroundColor(.bluffOyster800)
                            .lineLimit(2)
                        Spacer()
                        if listing.isClassified {
                            ClassifiedPriceView(listing: listing)
                        }
                        else {
                            AuctionPriceView(listing: listing)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

extension LatestListingsView.ListingView {
    
    struct AuctionPriceView: View {
        
        var listing: ListingModel
        
        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(listing.priceDisplay)
                        .fontWeight(.medium)
                        .foregroundColor(.bluffOyster800)
                    Text("Current price")
                        .font(.caption)
                        .foregroundColor(.bluffOyster600)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(listing.priceDisplay)
                        .fontWeight(.medium)
                        .foregroundColor(.bluffOyster800)
                    Text("Buy Now")
                        .font(.caption)
                        .foregroundColor(.bluffOyster600)
                }
            }
        }
    }
    
    struct ClassifiedPriceView: View {
        
        var listing: ListingModel
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(listing.priceDisplay)
                    .fontWeight(.medium)
                    .foregroundColor(.bluffOyster800)
                Text("Asking price")
                    .font(.caption)
                    .foregroundColor(.bluffOyster600)
                
            }
        }
    }
}

fileprivate extension Image {
    
    func listingViewImageStyle() -> some View {
        self.scaledToFill()
            .frame(width: 88, height: 96)
            .background(.tertiary)
            .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    LatestListingsView(viewModel: .init(listingsProvider: .withMockEntries()))
}
