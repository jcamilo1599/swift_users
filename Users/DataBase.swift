//
//  DataBase.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 25/12/22.
//

import Foundation

final class DataBase {
    private let key = "key"
    
    func save(items: Set<Data>) {
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: key)
    }
    
    func load() -> Set<Data> {
        let array = UserDefaults.standard.array(forKey: key) as? [Data] ?? [Data]()
        return Set(array)
    }
}
