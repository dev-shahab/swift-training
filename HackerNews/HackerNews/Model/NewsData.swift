//
//  NewsData.swift
//  HackerNews
//
//  Created by Dev on 19/08/2022.
//

import Foundation

struct NewsData: Decodable {
    
    var hits:[Post]
    
}

struct Post: Decodable, Identifiable{
    
    
    var id: String{
        return objectID
    }
    let objectID:String
    let points:Int
    let title: String
    let url: String?
}
