//
//  WeatherManager.swift
//  Clima
//
//  Created by Dev on 08/08/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDeligate{
    func didUpdateWeather(weather:WeatherModel)
    func didFailWithError(error:Error)
}

struct WeatherManager{
    
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=53eb06b1b8329603e12dac39e116f9ea&units=metric&q="
    
    var delegate:WeatherManagerDeligate?
    
    func fetchWeatherData(cityName city:String){
        let urlString = url + city
        
        if let urlObject = URL(string: urlString){
            print("In URL Object")
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: urlObject) { data, urlResponse, error in
                if error != nil{
                    //print(error)
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                else{
                    if let safeData = data{
                        if let weatherData = parseJSON(weatherData: safeData){
                            
                            self.delegate?.didUpdateWeather(weather: weatherData)
                            
                        }
                    }
                    }
                }
            
            task.resume()
        }
        }
        
        
    
    
    func parseJSON(weatherData:Data) -> WeatherModel?{
        
        let decoder = JSONDecoder()
        do{
            let decodable = try decoder.decode(WeatherData.self, from: weatherData)
            //print(decodable.weather[0].description)
            let weatherModel = WeatherModel(weatherId: decodable.weather[0].id, temp:decodable.main.temp, name: decodable.name)
            //print(weatherModel.temperatureString)
            return weatherModel
        }
            catch{
                //print(error)
                self.delegate?.didFailWithError(error: error)
                return nil
        }
    }
    
    
   
    
}
