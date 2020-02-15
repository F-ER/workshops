//
//  Compine+Example.swift
//  SwiftUICode
//
//  Created by Abdullah Alhaider on 15/02/2020.
//  Copyright © 2020 Abdullah Alhaider. All rights reserved.
//

import Foundation
// import SwiftUI
// import Combine

class ViewModel: ObservableObject {
    
    @Published private(set) var coins: [Coin] = []
    
    init() {
        fetch()
    }
    
    func fetch() {
        let url = URL(string: "https://api.coinmarketcap.com/v1/ticker/")!
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            guard error == nil else { return }
            guard let recevedData = data else { return }
            
            do {
                let recevedCoins = try JSONDecoder().decode([Coin].self, from: recevedData)
                DispatchQueue.main.async { self.coins = recevedCoins }
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}

