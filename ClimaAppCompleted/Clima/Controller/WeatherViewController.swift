//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDeligate {

    var weatherManager = WeatherManager()
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        weatherManager.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func searchButtinPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //print("Ending text field")
        weatherManager.fetchWeatherData(cityName: textField.text!)
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }

    func didUpdateWeather(weather: WeatherModel) {
        
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.name
            self.conditionImageView.image = UIImage.init(systemName: weather.weatherCondition)
        }

        //print(weather.temperatureString)
        //print("Bismillah")
    }
    
    func didFailWithError(error: Error) {
        print(error)
        print("Error Printed")
    }

}

