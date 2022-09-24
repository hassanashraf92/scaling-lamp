//
//  WeatherDataModel.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 17/09/2022.
//

import Foundation
import UIKit

class CityWeatherViewModel {
    
    var currentTemp: String?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Int?
    var humidity: String?
    var wind: String?
    var weatherMainState: String?
    var receivedInformationDate: String?
    var viewBackgroundColor: UIColor?
    
    init(data: WeatherDataResponse) {
        
        if let currentTemp = data.main?.temp {
            self.currentTemp = String(format: "%.0f°", self.convertToCelsius(from: currentTemp))
            self.viewBackgroundColor = self.setViewBackgroundColor(basedOn: currentTemp)
        }
        
        if let dt = data.dt {
            let date = Date(timeIntervalSince1970: TimeInterval(dt))
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en")
            dateFormatter.dateFormat = "EEEE, d MMM yyyy HH:mm:ss"
            self.receivedInformationDate = dateFormatter.string(from: date)
        }
        
        if let humidity = data.main?.humidity {
            self.humidity = String(format: "%.0f%", humidity)
        }
        
        if let wind = data.wind?.speed {
            self.wind = String(format: "%.0f km", wind)
        }
        
        self.tempMax = data.main?.tempMax
        self.tempMin = data.main?.tempMin
        self.pressure = data.main?.pressure
        self.weatherMainState = data.weather?.first?.main
    }
    
    private func convertToCelsius(from kelvin: Double) -> Double {
        return kelvin - 273.15
    }
    
    private func setViewBackgroundColor(basedOn currentTemp: Double) -> UIColor? {
        var color: UIColor?
        switch self.convertToCelsius(from: currentTemp) {
        case 0..<15:
            self.viewBackgroundColor = #colorLiteral(red: 0.5568627451, green: 0.8823529412, blue: 0.8784313725, alpha: 1)
        case 15..<29:
            self.viewBackgroundColor = #colorLiteral(red: 0.4745098039, green: 0.9843137255, blue: 0.9176470588, alpha: 1)
        default:
            self.viewBackgroundColor = #colorLiteral(red: 0.9923486114, green: 0.9023499489, blue: 0.5945194364, alpha: 1)
        }
        return color
    }
    
}
