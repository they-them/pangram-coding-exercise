// Created by Luna Graysen on 2021-01-18.

import Foundation

struct Empty: Codable {}

protocol ServiceInterface: class {
    func setup()
}

extension ServiceInterface {
    func setup() {
        // Currently not needed but in case we ever need to add setup steps
    }
}
