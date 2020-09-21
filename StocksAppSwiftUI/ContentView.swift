//
//  ContentView.swift
//  StocksAppSwiftUI
//
//  Created by Brayan Munoz Campos on 9/20/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListVM.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ?
            self.stockListVM.stocks :
            self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm) }
        
        return NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -400)
                
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -350)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 100)
                
                NewsArticleView(newsArticles: self.stockListVM.news
                    , onDragBegin: { value in
                        self.stockListVM.dragOffSet = value.translation
                    }, onDragEnd: { value in
                        if value.translation.height < 0 {
                            self.stockListVM.dragOffSet = CGSize(width: 0, height: 100)
                        } else {
                            self.stockListVM.dragOffSet = CGSize(width: 0, height: 680)
                        }
                    })
                    .animation(.spring())
                    .offset(y: self.stockListVM.dragOffSet.height)
                
            }.navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}