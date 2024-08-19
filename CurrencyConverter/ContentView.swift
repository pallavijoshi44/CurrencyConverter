//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Pallavi Joshi on 25/03/2024.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var isInfoClicked = false
    @State var showSelectCurrency = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency = Currency.goldPenny
    @State var rightCurrency = Currency.silverPenny
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    var body: some View {
        ZStack {
            Image(.background).resizable().ignoresSafeArea()
            VStack{
                Image(.prancingpony).resizable().scaledToFit().frame(height: 200)
                Text("Currency Exchange").font(.largeTitle).foregroundStyle(.white)
                HStack {
                    HStack{
                        VStack {
                            HStack {
                                Image(leftCurrency.image).resizable().scaledToFit().frame(height: 33)
                                Text(leftCurrency.name).font(.headline).foregroundStyle(.white)
                            }
                            .onTapGesture {
                                showSelectCurrency.toggle()
                            }
                            .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                            .padding(.bottom, -5)
                            
                            TextField("Amount",text: $leftAmount)
                                .textFieldStyle(.roundedBorder)
                                .multilineTextAlignment(.leading)
                                .focused($leftTyping)
                                .keyboardType(.decimalPad)
                        }
                    }
                    
                    Image(systemName:"equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .symbolEffect(.pulse)
                    
                    HStack{
                        VStack {
                        HStack {
                            Text(rightCurrency.name).font(.headline).foregroundStyle(.white)
                            Image(rightCurrency.image).resizable().scaledToFit().frame(height:33)
                            }.onTapGesture {
                            showSelectCurrency.toggle()
                        }.padding(.bottom, -5)
                        
                        TextField(rightCurrency.name, text: $rightAmount)
                                .textFieldStyle(.roundedBorder)
                                .multilineTextAlignment(.trailing)
                                .focused($rightTyping)
                                .keyboardType(.decimalPad)
                            
                        }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        isInfoClicked.toggle()
                    } label: {
                        Image(systemName:"info.circle.fill").font(.largeTitle).foregroundColor(.white).padding(10)
                    }
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert( leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency) {
                rightAmount = leftCurrency.convert( leftAmount, to: rightCurrency)
        }
        .onChange(of: rightCurrency) {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            
        }
        .sheet(isPresented: $isInfoClicked, content: {
            ExchangeInfo()
        })
        .sheet(isPresented:$showSelectCurrency, content: {
            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
        })
    }
}

#Preview {
    ContentView()
}
