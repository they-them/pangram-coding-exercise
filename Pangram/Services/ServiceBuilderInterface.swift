// Created by Luna Graysen on 2021-01-18.

import Foundation

protocol ServiceBuilderInterface {
    var realm: RealmPersistenceServiceInterface { get }
    func setup()
}

extension ServiceBuilderInterface {
    func setup() {
        realm.setup()
    }
}
