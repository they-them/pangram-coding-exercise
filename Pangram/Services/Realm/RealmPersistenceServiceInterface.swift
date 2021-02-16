// Created by Luna Graysen on 2021-01-18.

import Foundation
import RealmSwift

protocol RealmPersistenceServiceInterface: ServiceInterface {
    func add(pangram: Pangram)
    func remove(pangramString: String)
    func fetch() -> [Pangram]
}
