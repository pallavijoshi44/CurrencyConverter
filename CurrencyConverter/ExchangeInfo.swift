//
//  ExchangeInfo.swift
//  CurrencyConverter
//
//  Created by Pallavi Joshi on 21/04/2024.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image(.parchment).resizable().ignoresSafeArea().background(.brown)
            VStack {
                Text("Exchange Rate").font(.largeTitle).tracking(3)
                
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ExchangeInfo()
}
