//
//  Model.swift
//  CollectionView+SwiftUI
//
//  Created by Ivan Pryhara on 14.06.22.
//

import Foundation

struct Stat: Hashable, Identifiable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(statistics.count)
    }
    static func == (lhs: Stat, rhs: Stat) -> Bool {
        return lhs.id == rhs.id && lhs.statistics.count == rhs.statistics.count
    }
    
    var id = UUID()
    var statistics: [Entity]
    
}

struct Entity: Identifiable {
    var id = UUID()
    var time: Int
    var number: Int
}
