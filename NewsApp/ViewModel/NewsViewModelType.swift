//
//  NewsViewModelType.swift
//  NewsApp
//
//  Created by Aminjoni Abdullozoda on 7/6/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import Foundation

protocol NewsViewModelType {
    func numberRows() -> Int
    var values: Box<[Article]?> {get}
    func articleItem(forIndexPath indexPath : IndexPath) -> Article?
}
