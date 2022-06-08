//
//  ContentView.swift
//  SwiftUI-Charts-WWDC2022
//
//  Created by Ivan Pryhara on 8.06.22.
//

import SwiftUI
import Charts

struct Pancakes: Identifiable {
    let name: String
    let sales: Int
    
    var id: String { name }
}

let sales: [Pancakes] = [
    .init(name: "Cachapa", sales: 915),
    .init(name: "Injera", sales: 453),
    .init(name: "Crêpe", sales: 812),
    .init(name: "Jian Bing", sales: 789),
    .init(name: "Dosa", sales: 721),
    .init(name: "American", sales: 601)

]

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Chart {
                ForEach(sales) { element in
                    BarMark(
                        x: .value("Sales", element.sales),
                        y: .value("Name", element.name)
                    )
                }
               
            }.padding( 50)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
