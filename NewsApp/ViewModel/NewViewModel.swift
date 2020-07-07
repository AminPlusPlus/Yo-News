//
//  NewViewModel.swift
//  NewsApp
//
//  Created by Aminjoni Abdullozoda on 7/6/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation

class NewsViewModel : NewsViewModelType {
    
    
    private var networking: Networking
    var values: Box<[Article]?> = Box(nil)
    
    func numberRows() -> Int {
        return values.value?.count ?? 0
    }
    
    func articleItem(forIndexPath indexPath: IndexPath) -> Article? {
        let row = indexPath.row
        
        return values.value?[row]
    }
    
    init(_ network : Networking) {
        self.networking = network
        let strUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=c647e26e297144e7912b256d62134180"
         
          self.networking.fetch(forUrl: strUrl) { (data, error) in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            self.values.value = data as? [Article]
           
        }
    }
    
    
}
