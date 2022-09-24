//
//  ViewController.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 16/09/2022.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var citiesTableView: UITableView! {
        didSet {
            citiesTableView.delegate = self
            citiesTableView.dataSource = self
            citiesTableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
        }
    }
    
    var coordinator: AppCoordinator?
    private var cities: [String] = ["Cairo", "Tanta", "Alexandria", "Hurghada", "Toronto", "New York"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.227265656, green: 0.253387481, blue: 0.4082328081, alpha: 1)
        self.title = "Cities"
    }


}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.coordinator?.navigateToDetailsViewController(cities[indexPath.row])
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell
        cell?.config(cities[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
}
