//
//  WalpaperData.swift
//  QuoteShuote
//
//  Created by Dev on 16/08/2022.
//

import Foundation


struct WalpaperData:Codable{
    
    var hits:[Hits]
    
}

struct Hits:Codable{
    
    var webformatURL:String
}
