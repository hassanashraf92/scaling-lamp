//
//  WeatherDetailsView.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 20/09/2022.
//

import UIKit

class WeatherDetailsView: UIView {
    
    private lazy var weatherDetailsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 36
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var humidityStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var tempStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var windStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.axis = .vertical
        return stackView
    }()
    
    
    private lazy var humidityImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "humidity-icon")
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return imageView
    }()
    
    private lazy var tempImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "temperature-icon")
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return imageView
    }()
    
    private lazy var windImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "wind-icon")
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return imageView
    }()
    
    private lazy var humidityLabel: UILabel! = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tempLabel: UILabel! = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var windLabel: UILabel! = {
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
    func config(_ temp: String, _ wind: String, _ humidity: String) {
        self.windLabel.text = wind
        self.tempLabel.text = temp
        self.humidityLabel.text = humidity
    }
    
    //MARK: - Setup Views
    private func setupViews() {
        self.addSubview(weatherDetailsStackView)
    
        weatherDetailsStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        weatherDetailsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        weatherDetailsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        weatherDetailsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 12).isActive = true

        humidityStackView.addArrangedSubview(humidityImageView)
        humidityStackView.addArrangedSubview(humidityLabel)
        
        tempStackView.addArrangedSubview(tempImageView)
        tempStackView.addArrangedSubview(tempLabel)
        
        windStackView.addArrangedSubview(windImageView)
        windStackView.addArrangedSubview(windLabel)
        
        weatherDetailsStackView.addArrangedSubview(humidityStackView)
        weatherDetailsStackView.addArrangedSubview(tempStackView)
        weatherDetailsStackView.addArrangedSubview(windStackView)
    }
    
    
    
    
}
