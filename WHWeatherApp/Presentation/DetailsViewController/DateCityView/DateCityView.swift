//
//  DateCityView.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 20/09/2022.
//

import UIKit

class DateCityView: UIView {
    
    private lazy var currentDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cityNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //initWithFrame to init view from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure View
    func config(_ date: String,_ cityName: String,_ dateTime: String) {
        self.cityNameLabel.text = cityName
        self.dateTimeLabel.text = dateTime
        self.currentDateLabel.text = "Today"
    }
    
    //MARK: - Setup Views
    private func setupViews() {
        self.addSubview(currentDateLabel)
        self.addSubview(cityNameLabel)
        self.addSubview(dateTimeLabel)
        
        currentDateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        currentDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        
        cityNameLabel.topAnchor.constraint(equalTo: self.currentDateLabel.bottomAnchor, constant: 8).isActive = true
        cityNameLabel.leadingAnchor.constraint(equalTo: self.currentDateLabel.leadingAnchor).isActive = true
        
        dateTimeLabel.topAnchor.constraint(equalTo: self.cityNameLabel.bottomAnchor, constant: 8).isActive = true
        dateTimeLabel.leadingAnchor.constraint(equalTo: self.currentDateLabel.leadingAnchor).isActive = true
        dateTimeLabel.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: -12).isActive = true
    }
    
    
    
    
}
