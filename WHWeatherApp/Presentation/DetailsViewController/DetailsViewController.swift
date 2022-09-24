//
//  DetailsViewController.swift
//  WHWeatherApp
//
//  Created by Hassan Ashraf on 17/09/2022.
//

import UIKit

class DetailsViewController: UIViewController, Storyboarded {
    
    var scrollView: UIScrollView!
    var containerView: UIView!
    
    private lazy var dateCityView = DateCityView()
    private lazy var weatherView = MainWeatherView()
    private lazy var weatherDetailsView = WeatherDetailsView()

    var maxTempLabel: UILabel!
    var minTempLabel: UILabel!
    
    var viewModel: DetailsViewModel?
    private lazy var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScrollView()
        self.setupViewState()
        self.viewModel?.fetchData()
    }
    
    private func setupViewState() {
        self.viewModel?.viewState.bind(observer: { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .empty:
                break
            case .loading:
                self.activityIndicator.color = .red
                self.activityIndicator.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
                self.view.addSubview(self.activityIndicator)
                self.activityIndicator.startAnimating()
                break
            case .populated:
                self.activityIndicator.startAnimating()
                self.activityIndicator.removeFromSuperview()
                self.setupDateCityStackView()
                self.setupMainWeatherView()
                self.setupWeatherDetailsView()
                self.dateCityView.config("Today", self.viewModel?.cityName ?? "", self.viewModel?.model?.receivedInformationDate ?? "")
                self.weatherView.config("", self.viewModel?.model?.currentTemp ?? "", self.viewModel?.model?.weatherMainState ?? "")
                self.weatherDetailsView.config(self.viewModel?.model?.currentTemp ?? "", self.viewModel?.model?.wind ?? "", self.viewModel?.model?.humidity ?? "")
                self.view.backgroundColor = self.viewModel?.model?.viewBackgroundColor
                break
            default:
                break
            }
        })
    }
}

//MARK: - Setup UI
extension DetailsViewController {
    private func setupScrollView() {
        view.backgroundColor = .white
        scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        let containerHeightAnchor = containerView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor)
        containerHeightAnchor.priority = .defaultLow
        containerHeightAnchor.isActive = true
    }

    private func setupDateCityStackView() {
        dateCityView = DateCityView()
        dateCityView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(dateCityView)
        dateCityView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        dateCityView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
    }
    
    private func setupMainWeatherView() {
        weatherView = MainWeatherView()
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(weatherView)
        weatherView.topAnchor.constraint(equalTo: self.dateCityView.bottomAnchor, constant: 12).isActive = true
        weatherView.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
    }
    
    private func setupWeatherDetailsView() {
        weatherDetailsView = WeatherDetailsView()
        weatherDetailsView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(weatherDetailsView)
        weatherDetailsView.topAnchor.constraint(equalTo: self.weatherView.bottomAnchor, constant: 36).isActive = true
        weatherDetailsView.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
    }

}
