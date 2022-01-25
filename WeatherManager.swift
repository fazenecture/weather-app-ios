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
            let task = sessions.dataTask(with: url) { (data, response,error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            let conditionName = weather.conditionName
            print(conditionName)
        } catch {
            print(error)
        }
        
    }
    
    

}
