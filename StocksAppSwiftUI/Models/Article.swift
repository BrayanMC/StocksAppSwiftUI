//
//  Article.swift
//  StocksAppSwiftUI
//
//  Created by Brayan Munoz Campos on 9/20/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import Foundation

struct Article: Decodable {
    let title: String
    let imageURL: String
    let publication: String
}
