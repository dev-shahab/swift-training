//
//  quoteManager.swift
//  QuoteShuote
//
//  Created by Dev on 16/08/2022.
//

import Foundation


protocol QuoteManagerDelegate{
    func didFetchQuote(quoteData:QuoteDataModel)
}

struct QuoteManager{
    
    let url = "https://zenquotes.io/api/random"
    var delegate:QuoteManagerDelegate?
    
    func fetchRandomQuote(){
        performRequest(urlString: url)
    }
    
    func performRequest(urlString:String){
        
        if let urlObject = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlObject) { data, urlResponse, error in
                if let e = error{
                    print(e)
                }
                else{
                    if let safeData = data{
                        //let dataString = String(data: safeData, encoding: .utf8)
                        //print(dataString!)
                        if let quoteDataModel = self.parseJSON(data: safeData)
                        {
                            delegate?.didFetchQuote(quoteData: quoteDataModel)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(data:Data) -> QuoteDataModel?
    {
        let decoder = JSONDecoder()
        do{
            
            let decodable = try decoder.decode([QuoteData].self, from: data)
            //print(decodable[0].q)
            //print(decodable[0].a)
            let q = decodable[0].q
            let a = decodable[0].a
            let quoteDataModel = QuoteDataModel(quotation:q , author: a)
            return quoteDataModel
            
        }
        catch
        {
            
            print(error)
            return nil
        }
    }
}
