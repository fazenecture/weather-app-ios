//
//  ViewController.swift
//  Clima

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    var weatherManager = WeatherManager()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
        // Do any additional setup after loading the view.
    }


}


//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something..."
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = textField.text {
            print("Hello")
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
    
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            

        }
       
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
