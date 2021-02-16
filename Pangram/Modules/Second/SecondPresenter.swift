//
//  SecondPresenter.swift
//  Second
//
//  Created by Luna Graysen on 2021-01-19.
//

import Foundation

final class SecondPresenter: PresenterInterface, SecondPresenterRouterInterface, SecondPresenterViewInterface {

    var router: SecondRouterPresenterInterface!
    var interactor: SecondInteractorPresenterInterface!
    weak var view: SecondViewPresenterInterface!
    var pangramString: String = ""
    var pangramObject: Pangram?
    
    func handleBackButtonPressed() {
        interactor.persistToRealm(pangram: pangramObject)
        router.handleBackButtonPressed()
    }
    
    func start() {
        view.updateLabel(pangram: pangramString)
    }
    
    func checkPangram(string: String) -> Bool {
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        
        for character in alphabet {
            if string.contains(character) {
                continue
            } else {
                return false
            }
        }
        
        return true
    }
}

extension SecondPresenter: SecondPresenterInteractorInterface {

}
