//
//  ListingsFetcher.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import Foundation

struct ListingsFetcher {
    
    private let authenticationProvider: AuthenticationProvider
    
    private let latestListingsURL: URL
    
    private let urlSession: URLSession
    
    init(authenticationProvider: AuthenticationProvider, baseURL: URL, urlSession: URLSession = .shared) {
        self.authenticationProvider = authenticationProvider
        self.latestListingsURL = baseURL.appending(path: "/v1/listings/latest.json")
        self.urlSession = urlSession
    }
    
    func fetchListings(with parameters: [QueryParameters]) async throws -> Response {
        let request = try makeLatestListingRequest(with: parameters)
        let (data, _) = try await self.urlSession.data(for: request)
        
        return try JSONDecoder().decode(Response.self, from: data)
    }
    
    private func makeLatestListingRequest(with parameters: [QueryParameters]) throws -> URLRequest {
        var urlComponents = URLComponents.init(url: latestListingsURL, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = parameters.asQueryParameters()
        
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        authenticationProvider.setAuthenticationHeaders(in: &request)
        
        return request
    }
}
