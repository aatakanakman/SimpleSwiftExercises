//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Ali Atakan AKMAN on 20.06.2021.
//

import Foundation



//Table view için

//View ve model arasındaki köprü vm dir

struct NewsTableViewModel {
    
    let newsList : [News]
    
}

extension NewsTableViewModel {
    
    func numberOfRowsInSection() -> Int {
        
        return self.newsList.count
        
    }
    
    
    func newsAtIndexPath (_ index : Int) -> NewsViewModel {
        
        let news = self.newsList[index]
        
        return NewsViewModel(news: news)
    }
    
}



struct NewsViewModel {
    
    let news : News
    
    var title : String {
        return self.news.title
    }
    
    var story : String {
        return self.news.story
    }
    
}
