//
//  DefaultTableViewCell.swift
//  WeatherApp
//
//  Created by Tsimafei Zykau on 11/3/20.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {

    var label: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor(white: 0, alpha: 0)
        
        self.label = UILabel()
        self.label.textColor = .white
        self.label.numberOfLines = 0
        self.label.lineBreakMode = .byClipping
        self.label.baselineAdjustment = .alignCenters
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.topAnchor),
            self.label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
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
