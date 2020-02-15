//
//  Coin.swift
//  SwiftUICode
//
//  Created by Abdullah Alhaider on 15/02/2020.
//  Copyright © 2020 Abdullah Alhaider. All rights reserved.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id = UUID()
    let name: String
    let price: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case price = "price_btc"
    }
}
