//
//  WeatherModel.swift
//  Clima
//
//  Created by Dev on 08/08/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    
    let weatherId:Int
    let temp:Double
    let name: String
    var temperatureString:String{
        return String(format: "%.1f", temp)
    }
    
    
    var weatherCondition:String{
        switch weatherId {
        case 200 ... 232:
            return "cloud.bolt.rain"
        case 300 ... 321:
            return "cloud.drizzle"
        case 500 ... 531:
            return "cloud.heavyrain"
        case 600 ... 622:
            return "cloud.snow"
        case 701:
            return "cloud.fog"
        case 711:
            return "smoke"
        case 721:
            return "sun.haze"
        case 731:
            return "sun.dust"
        case 741:
            return "cloud.fog.fill"
        case 781:
            return "tornado"
        case 800:
            return "sun.min"
        case 801 ... 804:
            return "cloud.fill"
        default:
            return "questionmark.circle"
        }
    }
    
    
}
