//
//  DetailsUseCase.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 17/09/2022.
//

import Foundation

protocol DetailsUseCaseoProtocol: AnyObject {
    func excute(with cityName: String, completion: @escaping(CityWeatherViewModel?, String?) -> Void)
}

class DetailsUseCase: DetailsUseCaseoProtocol {
    
    private var dataSource: DetailsDataSourceProtocol
    
    init(dataSource: DetailsDataSourceProtocol = DetailsDataSource()) {
        self.dataSource = dataSource
    }
    
    func excute(with cityName: String, completion: @escaping(CityWeatherViewModel?, String?) -> Void) {
        self.dataSource.excute(with: cityName) { data, error in
            if let data = data {
                let model = CityWeatherViewModel(data: data)
                completion(model, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
