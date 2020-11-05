//
//  StatsTableViewCell.swift
//  WeatherApp
//
//  Created by Tsimafei Zykau on 11/3/20.
//

import UIKit

class StatsTableViewCell: UITableViewCell {
    
    var propertyNameLabel: UILabel!
    var propertyValueLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor(white: 0, alpha: 0)
        
        self.propertyNameLabel = UILabel()
        self.propertyValueLabel = UILabel()
        
        self.propertyNameLabel.textColor = .lightGray
        self.propertyValueLabel.textColor = .white
        
        self.propertyNameLabel.font = UIFont.systemFont(ofSize: 12)
        self.propertyValueLabel.font = UIFont.systemFont(ofSize: 28)
        
        self.propertyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.propertyValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(propertyNameLabel)
        self.addSubview(propertyValueLabel)
        
        NSLayoutConstraint.activate([
            self.propertyNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.propertyNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.propertyNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.propertyNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.propertyNameLabel.heightAnchor.constraint(equalToConstant: 12),
            
            self.propertyValueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.propertyValueLabel.topAnchor.constraint(equalTo: self.propertyNameLabel.bottomAnchor),
            self.propertyValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.propertyValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.propertyValueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
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
