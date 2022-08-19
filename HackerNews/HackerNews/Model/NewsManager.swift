//
//  NewsManager.swift
//  HackerNews
//
//  Created by Dev on 19/08/2022.
//

import Foundation

class NewsManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(){
        let url = "https://hn.algolia.com/api/v1/search?tags=front_page"
        performRequest(url: url)
    }
    
    func performRequest(url: String){
        
        if let urlObject = URL(string: url){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlObject) { data, urlResponse, error in
                
                if let e = error{
                    print(e)
                }
                else{
                    
                    if let safeData = data{
                        
                        do{
                            print("Do Block")
                            let decoder = JSONDecoder()
                            let decodable = try decoder.decode(NewsData.self, from: safeData)
                            print(decodable.hits[0].title)
                            
                            DispatchQueue.main.async {
                                self.posts = decodable.hits
                                print("In dispatch")
                                //print(decodable.hits[0].title)
                            }
                            
                            
                        }
                        catch{
                            print(error)
                        }
                        
                    }
                    
                }
                
            }
            task.resume()
        }
        
        
    }
    
}
