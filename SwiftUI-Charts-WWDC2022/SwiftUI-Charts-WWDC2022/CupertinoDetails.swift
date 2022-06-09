//
//  CupertinoDetails.swift
//  SwiftUI-Charts-WWDC2022
//
//  Created by Ivan Pryhara on 8.06.22.
//

import SwiftUI
import Charts

struct SalesSummary: Identifiable {
    let weekday: Date
    let sales: Int
    
    var id: Date { weekday }
}

let cupertinoData: [SalesSummary] = [

    .init(weekday: Date(timeIntervalSinceNow: 86400), sales: 340),

    .init(weekday: Date(timeIntervalSinceNow: 86400 * 2), sales: 349),
    
    .init(weekday: Date(timeIntervalSinceNow: 86400 * 3), sales: 380),
    
    .init(weekday: Date(timeIntervalSinceNow: 86400 * 4), sales: 322),
    
    .init(weekday: Date(timeIntervalSinceNow: 86400 * 5), sales: 405),
    
    .init(weekday: Date(timeIntervalSinceNow: 86400 * 6), sales: 376),
    
    .init(weekday: Date(timeIntervalSinceNow: 86400 * 7), sales: 351)
]

struct CupertinoDetails: View {
    var body: some View {
        VStack(alignment: .trailing) {
            Chart (cupertinoData) { element in
                //            BarMark (
                //                x: .value("Day", element.weekday, unit: .day),
                //                y: .value("Sales", element.sales)
                //            )
                
//                LineMark(x: .value("Day", element.weekday, unit: .day),
//                         y: .value("Sales", element.sales)
//                )
//
//                PointMark(x: .value("Day", element.weekday, unit: .day),
//                          y: .value("Sales", element.sales)
//                          )
                
//                AreaMark(x: .value("Day", element.weekday, unit: .day),
//                         y: .value("Sales", element.sales)
//                         )
                
//                RuleMark(x: .value("Day", element.weekday, unit: .day))
                RectangleMark(x: .value("Day", element.weekday, unit: .day),
                              y: .value("Sales", element.sales)
                )
            }.padding(60)
            
            Spacer()
        }
    }
}

struct CupertinoDetails_Previews: PreviewProvider {
    static var previews: some View {
        CupertinoDetails()
    }
}
