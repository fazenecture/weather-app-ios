//
//  WeatherManager.swift
//  Clima
//
//  Created by Vivek Kumar Singh on 25/01/22.

import Foundation
import UIKit

struct WeatherManager {
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=bf578cae77350e81058299bb32a592f9&units=metric"
    
    func fetchWeather (cityName: String) {
        let urlString = "\(url)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            let sessions = URLSession(configuration: .default)
            let task = sessions.dataTask(with: url, completionHandler: handle(data: response: error: ))
            
            task.resume()
        }
        
    }
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
        
    }

}
