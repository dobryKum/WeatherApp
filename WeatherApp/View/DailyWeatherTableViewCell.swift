//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by Tsimafei Zykau on 10/28/20.
//

import UIKit

class DailyWeatherTableViewCell: UITableViewCell {
    
    var dayLabel: UILabel!
    var highTempLabel: UILabel!
    var lowTempLabel: UILabel!
    var iconImageView: UIImageView!
    var percentageLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor(white: 0, alpha: 0)
        
        self.dayLabel = UILabel()
        self.highTempLabel = UILabel()
        self.lowTempLabel = UILabel()
        self.iconImageView = UIImageView()
        self.percentageLabel = UILabel()
        
        self.dayLabel.textColor = .white
        self.highTempLabel.textColor = .white
        self.lowTempLabel.textColor = .lightGray
        self.percentageLabel.textColor = .white
        
        self.highTempLabel.textAlignment = .right
        self.lowTempLabel.textAlignment = .right
        self.iconImageView.contentMode = .center
        
//        self.percentageLabel.text = "80%"
        
        self.addSubview(self.dayLabel)
        self.addSubview(self.highTempLabel)
        self.addSubview(self.lowTempLabel)
        self.addSubview(self.iconImageView)
        self.addSubview(self.percentageLabel)
        
        self.dayLabel.translatesAutoresizingMaskIntoConstraints = false
        self.highTempLabel.translatesAutoresizingMaskIntoConstraints = false
        self.lowTempLabel.translatesAutoresizingMaskIntoConstraints = false
        self.iconImageView.translatesAutoresizingMaskIntoConstraints = false
        self.percentageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.dayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.dayLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.dayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.dayLabel.trailingAnchor.constraint(equalTo: self.iconImageView.leadingAnchor),
            
            self.iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.iconImageView.widthAnchor.constraint(equalToConstant: 30),
            self.iconImageView.heightAnchor.constraint(equalToConstant: 30),
            
            self.percentageLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.percentageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.percentageLabel.leadingAnchor.constraint(equalTo: self.iconImageView.trailingAnchor, constant: 5),
            
            self.highTempLabel.trailingAnchor.constraint(equalTo: self.lowTempLabel.leadingAnchor, constant: -10),
            self.highTempLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.highTempLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.highTempLabel.widthAnchor.constraint(equalToConstant: 40),
            
            self.lowTempLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.lowTempLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.lowTempLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.lowTempLabel.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
