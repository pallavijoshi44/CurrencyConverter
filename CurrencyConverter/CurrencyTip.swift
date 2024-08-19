//
//  CurrencyTip.swift
//  CurrencyConverter
//
//  Created by Pallavi Joshi on 14/08/2024.
//

import SwiftUI
import TipKit

struct CurrencyTip:  Tip {
        var title: Text {
           Text("Currency")
        }
        var message: Text? {
            Text("Click her to change currency")
        }
}
