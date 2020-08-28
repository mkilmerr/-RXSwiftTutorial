//
//  HomeViewController.swift
//  RXSwiftTutorial
//
//  Created by Marcos Kilmer on 28/08/20.
//  Copyright © 2020 mkilmer. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController,UINavigationControllerDelegate {
    
    let disposeBag = DisposeBag()
    let choiceLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupComponents()
    }
    
    
    @objc func addTapped() {
        
        let choiceLabelViewController = ChoiceLabelViewController()
        choiceLabelViewController.selectedOption
            .subscribe(onNext: { [ weak self ] option in
                self?.choiceLabel.text = option
            }).disposed(by: disposeBag)
        
        navigationController?.pushViewController(choiceLabelViewController, animated: true)
    }
    
    func setupComponents(){
        title = "RXSwift"
        let settingsBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(addTapped))
        navigationItem.setRightBarButton(settingsBarButtonItem, animated: false)
        
        
        choiceLabel.text = ""
        view.addSubview(choiceLabel)
        choiceLabel.translatesAutoresizingMaskIntoConstraints = false
        choiceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        choiceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
}
