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
    @IBOutlet weak var cityLabel: UILabel! {
        didSet {
            cityLabel.textColor = .white
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(_ city: String) {
        self.cityLabel.text = city
    }
}
