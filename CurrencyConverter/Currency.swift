//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Pallavi Joshi on 06/08/2024.
//

import Foundation
import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 64000.0
    case goldPiece = 64.0
    case silverPenny = 16
    case silverPiece = 8
    case goldPenny = 4
    
    //var id: Double  { rawValue }
    var id: Currency  { self }

    
    var image : ImageResource {
        
        switch self {
        case .copperPenny: .copperpenny
        case .silverPenny: .silverpenny
        case .silverPiece: .silverpiece
        case .goldPenny: .goldpenny
        case .goldPiece: .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny: "Copper Penny"
        case .goldPiece: "Gold Piece"
        case .silverPenny: "Silver Penny"
        case .silverPiece: "Silver Piece"
        case .goldPenny: "Gold Penny"
        }
    }
        
    func convert(_ amountString: String, to currency: Currency) -> String {
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        return String(format: "%.2f", convertedAmount)
    }
}
