//
//  List+Ext.swift
//  MovieX
//
//  Created by Raden Dimas on 27/12/22.
//

import Foundation
import RealmSwift

public extension List {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
}
