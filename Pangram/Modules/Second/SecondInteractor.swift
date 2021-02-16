//
//  SecondInteractor.swift
//  Second
//
//  Created by Luna Graysen on 2021-01-19.
//

import Foundation

final class SecondInteractor: InteractorInterface {

    weak var presenter: SecondPresenterInteractorInterface!
}

extension SecondInteractor: SecondInteractorPresenterInterface {
    func persistToRealm(pangram: Pangram?) {
        guard let pangram = pangram else {
            return
        }
        
        ServiceBuilder().realm.add(pangram: pangram)
    }
    

}
