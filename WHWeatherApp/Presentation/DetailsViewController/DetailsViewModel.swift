//
//  DetailsViewModel.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 17/09/2022.
//

import Foundation

enum ViewState {
    case loading
    case error
    case empty
    case populated
    case cancel
}

class DetailsViewModel {
    
    var cityName: String
    private var useCase: DetailsUseCaseoProtocol
    var model: CityWeatherViewModel?
    var error: String?
    
    var viewState: Bindable<ViewState> = Bindable<ViewState>(.empty)
    
    init(_ cityName: String) {
        self.cityName = cityName
        self.useCase = DetailsUseCase()
    }
    
    func fetchData() {
        self.viewState.value = .loading
        self.useCase.excute(with: cityName) { model, error in
            if let model = model {
                self.model = model
                self.viewState.value = .populated
            } else {
                self.error = error
                self.viewState.value = .error
            }
        }
    }

}
