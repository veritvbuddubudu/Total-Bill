//
//  TipsCollectionViewCell.swift
//  Total Bill
//
//  Created by Елена Горбунова on 26.10.2022.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    let procentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.7688137855, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        backgroundColor = #colorLiteral(red: 0.9221151471, green: 0.9337235093, blue: 0.9335193038, alpha: 1)
        layer.cornerRadius = 10  
        addSubview(procentLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        procentLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 3.4)
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            procentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            procentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            procentLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

