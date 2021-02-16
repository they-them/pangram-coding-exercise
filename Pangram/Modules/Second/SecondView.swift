//
//  SecondView.swift
//  Second
//
//  Created by Luna Graysen on 2021-01-19.
//

import Foundation
import UIKit

final class SecondView: UIViewController, ViewInterface {
    
    var presenter: SecondPresenterViewInterface!
    var label = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        view.addSubview(label)
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Again", for: .normal)
        button.addTarget(self, action: #selector(handleAgainButtonPressed(sender:)), for: .touchUpInside)
        
        view.addSubview(button)
        
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 25).isActive = true
        
        presenter.start()
    }
    
    @objc func handleAgainButtonPressed(sender: UIButton) {
        presenter.handleBackButtonPressed()
    }
}

extension SecondView: SecondViewPresenterInterface {
    func updateLabel(pangram: String) {
        if presenter.checkPangram(string: presenter.pangramString) {
            label.text = "Congrats! \(presenter.pangramString) is a pangram."
            let object = Pangram()
            object.text = presenter.pangramString
            object.result = true
            
            presenter.pangramObject = object
        } else {
            let object = Pangram()
            object.text = presenter.pangramString
            object.result = false
            
            presenter.pangramObject = object
            label.text = "Oh no! \(presenter.pangramString) is not a pangram."
        }
    }
}
