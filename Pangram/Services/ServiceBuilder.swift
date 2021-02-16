// Created by Luna Graysen on 2021-01-18.

import Foundation

final class ServiceBuilder: ServiceBuilderInterface {
    lazy var realm: RealmPersistenceServiceInterface = {
        RealmPersistenceService()
    }()
}
