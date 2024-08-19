//
//  SwiftUIView.swift
//  CurrencyConverter
//
//  Created by Pallavi Joshi on 16/05/2024.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency

    var body: some View {
        ZStack {
            Image(.parchment).resizable().ignoresSafeArea().background(.brown)
            VStack            {
                Text("Select the currency you are starting with: \(Currency.copperPenny.rawValue)").bold()
                IconGrid(currency: $leftCurrency)
               
                Text("Select the currency you you would like to convert to:").fontWeight(.bold)
                IconGrid(currency: $rightCurrency)

                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                .tint(.brown)
                .padding()
            }.padding(20)
        }
    }
}

#Preview {
    SelectCurrency(leftCurrency: .constant(.copperPenny), rightCurrency: .constant(.goldPiece))
}

