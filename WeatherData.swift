//
//  WeatherData.swift
//  Clima
//
//  Created by Vivek Kumar Singh on 25/01/22.


import Foundation

struct WeatherData: Decodable {

    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable  {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
    let description: String
}
