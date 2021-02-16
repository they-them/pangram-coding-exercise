//
//  Pangram.swift
//  Pangram
//
//  Created by Luna Graysen on 2021-01-19.
//

import Foundation
import RealmSwift

class Pangram: Object {
    @objc dynamic var text = ""
    @objc dynamic var result: Bool = false
    @objc dynamic var createdAt: Date = Date()
}
