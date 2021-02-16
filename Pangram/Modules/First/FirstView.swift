//
//  FirstView.swift
//  First
//
//  Created by Luna Graysen on 2021-01-19.
//

import Foundation
import UIKit

final class FirstView: UIViewController, ViewInterface {

    var presenter: FirstPresenterViewInterface!

    var textField = UITextField()
    var displayLabel = UILabel()
    var deleteTextField = UITextField()
    
    override func viewDidLoad() {
        view.backgroundColor = .green
        
        
        createUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.start()
    }
    
    func createUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Some text"
        
        
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Check Pangram", for: .normal)
        button.addTarget(self, action: #selector(handleButtonPressed(sender:)), for: .touchUpInside)
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Previous Attempts"
        
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        displayLabel.textColor = .white
        displayLabel.numberOfLines = 0
        
        deleteTextField.translatesAutoresizingMaskIntoConstraints = false
        deleteTextField.placeholder = "Object to delete"
        
        let deleteButton = UIButton(type: .system)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.addTarget(self, action: #selector(handleDeletePressed(sender:)), for: .touchUpInside)
        
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(displayLabel)
        view.addSubview(deleteTextField)
        view.addSubview(deleteButton)
        
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 25).isActive = true
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 25).isActive = true
        
        displayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        displayLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 25).isActive = true
        
        deleteTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deleteTextField.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: 25).isActive = true
        deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deleteButton.topAnchor.constraint(equalTo: deleteTextField.bottomAnchor, constant: 25).isActive = true
    }
    
    @objc func handleButtonPressed(sender: UIButton) {
        presenter.handleButtonPressed(pangram: textField.text ?? "error")
    }
    
    @objc func handleDeletePressed(sender: UIButton) {
        presenter.handleDeleteButtonPressed(deletionText: deleteTextField.text ?? "error")
    }
    
    
}

extension FirstView: FirstViewPresenterInterface {
    func updateUI(with string: String) {
        displayLabel.text = string
    }
    

}
