//
//  IconGrid.swift
//  CurrencyConverter
//
//  Created by Pallavi Joshi on 07/08/2024.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency : Currency
   
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
            ForEach(Currency.allCases, content: { currency in
                if self.currency == currency {
                    CurrencyIcon(currencyText: currency.name, currencyImage: currency.image)
                        .shadow(radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                }
                else
                {
                    CurrencyIcon(currencyText: currency.name, currencyImage: currency.image)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
            })
        })
    }
}

#Preview {
    IconGrid(currency:.constant(Currency.copperPenny))
            
}
