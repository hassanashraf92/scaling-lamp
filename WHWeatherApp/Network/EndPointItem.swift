//
//  EndPointItem.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 17/09/2022.
//

import Foundation

import Foundation
import Alamofire

enum NetworkEnvironment {
  case dev
}

//MARK: End Point Items
//Here goes all the end points we are going to use..
enum EndPointItem {
    case getCityWeatherData
}

//MARK: Then we confirm to the protocol we are going to use..
extension EndPointItem: EndPointType {

  var baseURL: String {
    switch self {
    case .getCityWeatherData:
        return "https://api.openweathermap.org/data/"
    default:
        return ""
    }
  }
  
  var version: String {
    switch self {
    case .getCityWeatherData:
        return "2.5/"
    default:
      return ""
    }
  }
  
  var path: String {
    switch self {
    case .getCityWeatherData:
        return "weather/"
    default:
        return ""
    }
  }
  
  var httpMethod: HTTPMethod {
    switch self {
    default:
      return .get
    }
  }


  var headers: HTTPHeaders {
    switch self {
      default:
        return ["Accept": "application/json"]
      }
  }
  
  var url: URL {
    switch self {
    default:
      return URL(string: self.baseURL + self.version + self.path)!
    }
  }
  
  var encoding: ParameterEncoding {
    switch self {
    case .getCityWeatherData:
        return URLEncoding.default
    default:
      return JSONEncoding.default
    }
  }

}
