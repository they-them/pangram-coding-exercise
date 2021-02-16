// Created by Luna Graysen on 2021-01-18.

import Foundation
import RealmSwift

final class RealmPersistenceService: RealmPersistenceServiceInterface {
    func remove(pangramString: String) {
        let all = fetch()
        let resulting = all.filter { $0.text == pangramString}
        
        if let exists = resulting.first {
            do {
                let realm = try Realm()
                try realm.write {
                    realm.delete(exists)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func add(pangram: Pangram) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(pangram)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func fetch() -> [Pangram] {
        do {
            let realm = try Realm()
            let pangram = realm.objects(Pangram.self).sorted(byKeyPath: "createdAt", ascending: false)
            let pangramArray: [Pangram] = pangram.map { $0 }
            
            return pangramArray
        } catch let error {
            print(error.localizedDescription)
            
            return []
        }
    }
    
    
}
