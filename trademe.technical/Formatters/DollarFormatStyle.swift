//
//  DollarFormatStyle.swift
//  trademe.technical
//
//  Created by Paul Haywood-Marx on 22/06/2025.
//

import Foundation

extension FormatStyle where Self == Decimal.FormatStyle.Currency {
    
    static var dollarAmount: Decimal.FormatStyle.Currency {
        .currency(code: "NZD")
            .precision(.fractionLength(2))
    }
}
