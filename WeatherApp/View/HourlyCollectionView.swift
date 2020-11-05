//
//  HourlyWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Tsimafei Zykau on 11/3/20.
//

import UIKit

class HourlyCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.backgroundColor = UIColor(white: 0, alpha: 0)
        self.register(HourlyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: "hourlyCollectionCell")
        self.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        let topGrayBreakline = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 1))
        topGrayBreakline.backgroundColor = .gray
        let bottomGrayBreakline = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 1))
        bottomGrayBreakline.backgroundColor = .gray
        
        topGrayBreakline.translatesAutoresizingMaskIntoConstraints = false
        bottomGrayBreakline.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(topGrayBreakline)
        self.addSubview(bottomGrayBreakline)
        NSLayoutConstraint.activate([
            topGrayBreakline.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -300),
//            topGrayBreakline.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15),
            
            topGrayBreakline.topAnchor.constraint(equalTo: self.topAnchor),
//            topGrayBreakline.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            topGrayBreakline.widthAnchor.constraint(equalToConstant: 2000),
            topGrayBreakline.heightAnchor.constraint(equalToConstant: 1),

            bottomGrayBreakline.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -300),
            bottomGrayBreakline.widthAnchor.constraint(equalToConstant: 2000),
            bottomGrayBreakline.heightAnchor.constraint(equalToConstant: 1),
            //someone explain me this behavior of the bottomAnchor
            bottomGrayBreakline.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 120)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
