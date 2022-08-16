//
//  WalpaperManager.swift
//  QuoteShuote
//
//  Created by Dev on 16/08/2022.
//

import Foundation


protocol WalpaperManagerDelegate{
    func didFetchImageUrl(url:String)
}


struct WalpaperManager{
    
    var url = "https://pixabay.com/api/?key=29140622-96553367edcfb890d920006c7&image_type=photo&pretty=true&orientation=vertical&order=latest&q="
    let query = "nature+walpaper"
    
    var delegate:WalpaperManagerDelegate?
    
    func fetchWalpaper(query:String?){
        var queryUrl = ""
        
        if let interestedQuery = query{
            queryUrl = url + interestedQuery
        }
        else{
            queryUrl = url + self.query
        }
        
        performRequest(urlString: queryUrl)
        
        
    }
    
    func performRequest(urlString:String){
        
        if let urlObject = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: urlObject) { data, urlResponse, error in
                if let e = error{
                    print(error)
                }
                else{
                    if let safeData = data{
                        //print(String(data: safeData, encoding: .utf8))
                        let imgUrl = parseJSON(data: safeData)
                        delegate?.didFetchImageUrl(url: imgUrl!)
                        
                    }
                }
            }
            task.resume()
        }
    }
 
    func parseJSON(data:Data) -> String?{
        
        let decoder = JSONDecoder()
        
        do{
            let decodable = try decoder.decode(WalpaperData.self, from: data)
            //print(decodable.hits[0].webformatURL)
            //print(decodable.hits.count)
            let randome = Int.random(in: 0 ... 19)
            return decodable.hits[randome].webformatURL
        }catch{
            return nil
            print(error)
        }
        
    }
    
}
