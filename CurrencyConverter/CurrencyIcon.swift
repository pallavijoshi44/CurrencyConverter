//
//  CurrencyIcon.swift
//  CurrencyConverter
//
//  Created by Pallavi Joshi on 06/08/2024.
//

import Foundation
import SwiftUI

struct CurrencyIcon: View {
    let currencyText: String
    let currencyImage: ImageResource
    var body: some View {
        ZStack(alignment: .bottom) {
                Image(currencyImage)
                    .resizable()
                    .scaledToFit()
                
                Text(currencyText)
                    .padding(3)
                    .font(.caption)
                    .frame(maxWidth: .infinity)
                    .background(.brown.opacity(0.75))
            
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyText: "Copper Penny", currencyImage: .copperpenny)
}
