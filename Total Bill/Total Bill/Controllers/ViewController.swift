//
//  ViewController.swift
//  Total Bill
//
//  Created by Елена Горбунова on 21.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .black
        //label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    let descriptionLable: UILabel = {
        let label = UILabel()
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.7688137855, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return  button
    }()
    
    let totalBillView = TotalBillView ()
    let personsView = PersonsView ()
    let tipsView = TipsView()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        addTap()
    }

    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(titleLable)
        titleLable.font = UIFont(name: "Avenir Next Bold", size: view.frame.height * 0.046)
        
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(descriptionLable)
        scrollView.addSubview(totalBillView)
        scrollView.addSubview(personsView)
        scrollView.addSubview(tipsView)
        scrollView.addSubview(calculateButton)
        calculateButton.titleLabel?.font = UIFont(name: "Futura", size: view.frame.height / 44)
    }
    
    @objc func calculateButtonTapped() {
        guard let totalBill = totalBillView.sumnTextField.text,
              let totalBillInt = Int(totalBill) else {
                  descriptionLable.text = "Enter total bill"
                  descriptionLable.textColor = .red
                  return }
        
        let summ = totalBillInt + totalBillInt * tipsView.tipsCount / 100
        let persons = personsView.counter
        
        if persons <= 2 {
            descriptionLable.text = "Enter persons count"
            descriptionLable.textColor = .red
        } else {
            let result = summ / persons
            descriptionLable.text = "\(result) per person"
            descriptionLable.textColor = .black
        }
    }
    func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func hideKeyboard () {
        view.endEditing(true)
    }
}

extension MainViewController {

    func setConstraints() {
        var views: [NSLayoutConstraint] = []
        views += initScrollView()
        views += initTitleLable()
        views += initLogoImageView()
        views += initDescriptionLable()
        views += initPersonsView()
        views += initTotalBillView()
        views += initCalculateButton()
        views += initTipsView()
        NSLayoutConstraint.activate(views)
    }
    
    private func initScrollView() -> [NSLayoutConstraint] {
        return [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
    }
    
    private func initTitleLable() -> [NSLayoutConstraint] {
        return [
            titleLable.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
    }
    
    private func initLogoImageView() -> [NSLayoutConstraint] {
        return [
            logoImageView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 10),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23)
        ]
    }
    
    private func initDescriptionLable() -> [NSLayoutConstraint] {
        return [
            descriptionLable.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            descriptionLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ]
    }
    
    private func initTotalBillView() -> [NSLayoutConstraint] {
        return [
            totalBillView.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 5),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillView.heightAnchor.constraint(equalToConstant: 130),
        ]
    }
    
    private func initPersonsView() -> [NSLayoutConstraint] {
        return [
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 5),
            personsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsView.heightAnchor.constraint(equalToConstant: 130),
        ]
    }
    
            private func initTipsView() -> [NSLayoutConstraint] {
                return [
                    tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 10),
                    tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    tipsView.heightAnchor.constraint(equalToConstant: 130)
                    ]
            }
    private func initCalculateButton() -> [NSLayoutConstraint] {
        return [
            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 15),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            calculateButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ]
    }
    }
    

