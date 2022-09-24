//
//  AppCoordinator.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 16/09/2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController.instantiate(storyboardName: "Main")
        homeViewController.coordinator = self
        self.navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func navigateToDetailsViewController(_ cityName: String) {
        let viewModel = DetailsViewModel(cityName)
        let detailsViewController = DetailsViewController.instantiate(storyboardName: "Main")
        detailsViewController.viewModel = viewModel
        self.navigationController.pushViewController(detailsViewController, animated: true)
    }
    
    
}
