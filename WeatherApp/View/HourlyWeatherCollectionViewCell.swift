//
//  HourlyWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Tsimafei Zykau on 11/3/20.
//

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    
    let hourLabel = UILabel()
    let weatherIconImage = UIImageView()
    let tempLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(white: 0, alpha: 0)
        self.addSubview(hourLabel)
        self.addSubview(weatherIconImage)
        self.addSubview(tempLabel)
        
        self.hourLabel.textColor = .white
        self.tempLabel.textColor = .white
        self.hourLabel.textAlignment = .center
        self.tempLabel.textAlignment = .center
        self.weatherIconImage.contentMode = .center
        
        self.hourLabel.translatesAutoresizingMaskIntoConstraints = false
        self.weatherIconImage.translatesAutoresizingMaskIntoConstraints = false
        self.tempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.hourLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.hourLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.hourLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.hourLabel.heightAnchor.constraint(equalToConstant: 20),
            
            self.tempLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.tempLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tempLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tempLabel.heightAnchor.constraint(equalToConstant: 20),
            
            self.weatherIconImage.topAnchor.constraint(equalTo: self.hourLabel.bottomAnchor),
            self.weatherIconImage.bottomAnchor.constraint(equalTo: self.tempLabel.topAnchor),
            self.weatherIconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.weatherIconImage.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
