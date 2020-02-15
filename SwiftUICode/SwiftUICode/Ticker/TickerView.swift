//
//  TickerView.swift
//  SwiftUICode
//
//  Created by Abdullah Alhaider on 15/02/2020.
//  Copyright © 2020 Abdullah Alhaider. All rights reserved.
//

import SwiftUI

struct TickerView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.coins) { coin in
                HStack() {
                    Text(coin.name)
                    Spacer()
                    Text(coin.price)
                }
            }
            .navigationBarTitle("Ticker")
        }
    }
}
