//
//  StockListViewModel.swift
//  StocksAppSwiftUI
//
//  Created by Brayan Munoz Campos on 9/20/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import Foundation
import SwiftUI

class StockListViewModel: ObservableObject {
    
    @Published var dragOffSet: CGSize = CGSize(width: 0, height: 680)
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
    
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchNews() {
        Webservice().getTopNews { (news) in
            if let news = news {
                DispatchQueue.main.async {
                    self.news = news.map(NewsArticleViewModel.init)
                }
            }
        }
    }
    
    private func fetchStocks() {
        Webservice().getStocks { (stocks) in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
}
