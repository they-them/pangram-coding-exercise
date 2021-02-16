//
//  FirstInteractor.swift
//  First
//
//  Created by Luna Graysen on 2021-01-19.
//

import Foundation

final class FirstInteractor: InteractorInterface {

    weak var presenter: FirstPresenterInteractorInterface!
}

extension FirstInteractor: FirstInteractorPresenterInterface {
    func handleDelete(deletionText: String) {
        ServiceBuilder().realm.remove(pangramString: deletionText)
        let results = ServiceBuilder().realm.fetch()
        presenter.updateUI(with: results)
    }
    
    func fetch() {
        let results = ServiceBuilder().realm.fetch()
        presenter.updateUI(with: results)
    }
    

}
