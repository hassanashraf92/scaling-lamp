//
//  CityTableViewCell.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 17/09/2022.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 8
            containerView.layer.backgroundColor = #colorLiteral(red: 0.3906085491, green: 0.2932481766, blue: 0.7138597369, alpha: 1)
        }
    }
    @IBOutlet weak var currentTempLabel: UILabel! {
        didSet {
            currentTempLabel.textColor = .white
        }
    }
    @IBOutlet weak var highestTempLabel: UILabel! {
        didSet {
            highestTempLabel.textColor = .gray
        }
    }
    @IBOutlet weak var lowestTempLabel: UILabel! {
        didSet {
            lowestTempLabel.textColor = .gray
        }
    }
    @IBOutlet weak var cityNameLabel: UILabel! {
        didSet {
            cityNameLabel.textColor = .white
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(_ city: String) {
        self.currentTempLabel.text = "19"
        self.highestTempLabel.text = "H: 34"
        self.lowestTempLabel.text = "L: 12"
        self.cityNameLabel.text = city
    }
}
