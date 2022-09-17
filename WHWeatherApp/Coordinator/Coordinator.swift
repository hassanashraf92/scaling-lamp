//
//  Coordinator.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 16/09/2022.
//

import Foundation
import UIKit

//MARK: - Coordinator Protocol
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

//MARK: - Storyboarded Protocol
protocol Storyboarded {
    static func instantiate(storyboardName: String, id: String?) -> Self
}

//MARK: - Storyboarded default initialization
extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboardName: String, id: String? = nil) -> Self {
        let id = id ?? String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
