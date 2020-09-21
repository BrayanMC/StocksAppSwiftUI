//
//  Stock.swift
//  StocksAppSwiftUI
//
//  Created by Brayan Munoz Campos on 9/20/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
