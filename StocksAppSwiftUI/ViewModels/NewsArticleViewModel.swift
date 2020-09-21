//
//  NewsArticleViewModel.swift
//  StocksAppSwiftUI
//
//  Created by Brayan Munoz Campos on 9/20/20.
//  Copyright © 2020 Brayan Munoz Campos. All rights reserved.
//

import Foundation

struct NewsArticleViewModel {
    
    let article: Article
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
}
