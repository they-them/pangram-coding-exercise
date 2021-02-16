//
//  FirstPresenter.swift
//  First
//
//  Created by Luna Graysen on 2021-01-19.
//

import Foundation

final class FirstPresenter: PresenterInterface {

    var router: FirstRouterPresenterInterface!
    var interactor: FirstInteractorPresenterInterface!
    weak var view: FirstViewPresenterInterface!

}

extension FirstPresenter: FirstPresenterRouterInterface {

}

extension FirstPresenter: FirstPresenterInteractorInterface {
    func updateUI(with results: [Pangram]) {
        let strings = results.map { (pangramObject) -> String in
            return "\(pangramObject.text) - \(pangramObject.result)"
        }
        
        let string = strings.joined(separator: "\n")
        view.updateUI(with: string)
    }
    

}

extension FirstPresenter: FirstPresenterViewInterface {
    func handleDeleteButtonPressed(deletionText: String) {
        interactor.handleDelete(deletionText: deletionText)
    }
    
    func handleButtonPressed(pangram: String) {
        router.handleButtonPressed(pangram: pangram)
    }
    

    func start() {
        interactor.fetch()
    }

}
