//
//  DetailsDataSource.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 17/09/2022.
//

import Foundation

protocol DetailsDataSourceProtocol {
    func excute(with cityName: String, completion: @escaping(WeatherDataResponse?, String?) -> Void)
}

class DetailsDataSource: DetailsDataSourceProtocol {
    
    func excute(with cityName: String, completion: @escaping(WeatherDataResponse?, String?) -> Void) {
        let parameters: [String: Any] = ["appid": "24941b0616ee96be01c7031d9067ab4c",
                                         "q": cityName]
        APIManager.shared().request(type: EndPointItem.getCityWeatherData, params: parameters) { (weatherData: WeatherDataResponse?, error: String?) in
            if let data = weatherData {
                completion(data, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
}
