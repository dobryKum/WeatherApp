//
//  HeaderView.swift
//  WeatherApp
//
//  Created by Tsimafei Zykau on 11/2/20.
//

import UIKit

class HeaderView: UIView {
    
    lazy var cityLabel: UILabel = {
        let cityLabel = UILabel()
        cityLabel.textColor = UIColor.white
        cityLabel.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        cityLabel.textAlignment = .center
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        return cityLabel
    }()
    
    lazy var summaryLabel: UILabel = {
        let summaryLabel = UILabel()
        summaryLabel.textColor = UIColor.white
        summaryLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        summaryLabel.textAlignment = .center
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        return summaryLabel
    }()
    
    lazy var mainTempLabel: UILabel = {
        let mainTempLabel = UILabel()
        mainTempLabel.textColor = UIColor.white
        mainTempLabel.font = UIFont.systemFont(ofSize: 80, weight: .light)
        mainTempLabel.textAlignment = .center
        mainTempLabel.translatesAutoresizingMaskIntoConstraints = false
        return mainTempLabel
    }()
    
    lazy var highestAndLowestTempLabel: UILabel = {
        let highestAndLowestTempLabel = UILabel()
        highestAndLowestTempLabel.textColor = UIColor.white
        highestAndLowestTempLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        highestAndLowestTempLabel.textAlignment = .center
        highestAndLowestTempLabel.translatesAutoresizingMaskIntoConstraints = false
        return highestAndLowestTempLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        addSubview(cityLabel)
        addSubview(summaryLabel)
        addSubview(mainTempLabel)
        addSubview(highestAndLowestTempLabel)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height * 0.2),
            cityLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8),
            
            summaryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            summaryLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor),
            
            mainTempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainTempLabel.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 5),
            
            highestAndLowestTempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            highestAndLowestTempLabel.topAnchor.constraint(equalTo: mainTempLabel.bottomAnchor)
        ])
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
}
