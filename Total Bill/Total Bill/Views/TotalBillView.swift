//
//  TotalBillView.swift
//  Total Bill
//
//  Created by Елена Горбунова on 21.10.2022.
//

import UIKit

class TotalBillView: UIView {
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sumnTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.9221151471, green: 0.9337235093, blue: 0.9335193038, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.7688137855, alpha: 1)
        textField.font = UIFont(name: "Avenir Next Bold", size: 48)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLable.font = UIFont(name: "Avenir Next", size: frame.width / 26.7)
        sumnTextField.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.6)
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
      
        addSubview(titleLable)
        addSubview(sumnTextField)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            sumnTextField.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 2),
            sumnTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            sumnTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            sumnTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
    
}
