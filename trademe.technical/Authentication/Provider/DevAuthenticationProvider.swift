//
//  DevAuthenticatedHeaderProvider.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import Foundation

struct DevAuthenticatedHeaderProvider: AuthenticationProvider {
    
    private static let consumerKey = "A1AC63F0332A131A78FAC304D007E7D1"
    private static let consumerSecret = "EC7F18B17A062962C6930A8AE88B16C7"
    
    func setAuthenticationHeaders(in request: inout URLRequest) {
        let oauthHeader = """
        OAuth oauth_consumer_key=\(Self.consumerKey),oauth_signature_method=PLAINTEXT,oauth_signature=\(Self.consumerSecret)&
        """
        
        request.setValue(oauthHeader, forHTTPHeaderField: "Authorization")
    }
}

extension AuthenticationProvider where Self == DevAuthenticatedHeaderProvider {
    
    static var devAuthenticationProvider: DevAuthenticatedHeaderProvider {
        return DevAuthenticatedHeaderProvider()
    }
}
