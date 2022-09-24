//
//  MainWeatherView.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 20/09/2022.
//

import UIKit

class MainWeatherView: UIView {
    
    private lazy var weatherStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var weatherImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sunny")
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return imageView
    }()
    
    private lazy var seperatorView: UIView = {
        let seperatorView = UIView()
        seperatorView.backgroundColor = .lightGray
        seperatorView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return seperatorView
    }()
    
    private lazy var currentTempStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = -12
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var currentTempLabel: UILabel! = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weatherStatusLabel: UILabel! = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 17)
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
    func config(_ iconName: String, _ currentTemp: String, _ status: String) {
        self.currentTempLabel.text = currentTemp
        self.weatherStatusLabel.text = status
    }
    
    //MARK: - Setup Views
    private func setupViews() {
        self.addSubview(weatherStackView)
    
        weatherStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        weatherStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        weatherStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        weatherStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 12).isActive = true

        weatherStackView.addArrangedSubview(weatherImageView)
        weatherStackView.addArrangedSubview(seperatorView)
        
        currentTempStackView.addArrangedSubview(currentTempLabel)
        currentTempStackView.addArrangedSubview(weatherStatusLabel)
        weatherStackView.addArrangedSubview(currentTempStackView)
    }
    
    
    
}
