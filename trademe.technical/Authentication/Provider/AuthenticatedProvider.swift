//
//  AuthenticationProvider.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 21/06/2025.
//

import Foundation

protocol AuthenticationProvider {
    
    func setAuthenticationHeaders(in request: inout URLRequest)
}
