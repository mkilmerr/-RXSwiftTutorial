//
//  ChoiceLabelViewController.swift
//  RXSwiftTutorial
//
//  Created by Marcos Kilmer on 28/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import RxSwift

class ChoiceLabelViewController: UIViewController {
    
    private let selectedOptionVariable = Variable("User")
    var selectedOption:Observable<String> {
        return selectedOptionVariable.asObservable()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .white
        title = "Select an item"
        setupComponents()
        
        
    }
    
    func setupComponents() {
        let chocolateLabel = UIButton(type: .system)
        chocolateLabel.setTitle("Hello 🍫", for: .normal)
        chocolateLabel.tintColor = .black
        chocolateLabel.addTarget(self, action: #selector(buttonDidTapped(sender:)), for: .allTouchEvents)
        
        let fruitLabel = UIButton(type: .system)
        fruitLabel.tintColor = .black
        fruitLabel.setTitle("Hello 🍎", for: .normal)
        fruitLabel.addTarget(self, action: #selector(buttonDidTapped(sender:)), for: .allTouchEvents)
        
        let milkLabel = UIButton(type: .system)
        milkLabel.tintColor = .black
        milkLabel.setTitle( "Hello 🥛", for: .normal)
        milkLabel.addTarget(self, action: #selector(buttonDidTapped(sender:)), for: .allTouchEvents)
        
        let stackView = UIStackView(arrangedSubviews: [chocolateLabel,fruitLabel,milkLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: view.topAnchor), stackView.leftAnchor.constraint(equalTo: view.leftAnchor), stackView.rightAnchor.constraint(equalTo: view.rightAnchor), stackView.heightAnchor.constraint(equalToConstant: 200)])
    }
    
    @objc func buttonDidTapped(sender:UIButton){
        if let text = sender.titleLabel?.text {
            selectedOptionVariable.value = text
        }
    }
    
    
}

