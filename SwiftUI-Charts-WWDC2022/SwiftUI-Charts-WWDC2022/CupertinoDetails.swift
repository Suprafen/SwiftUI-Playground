//
//  CupertinoDetails.swift
//  SwiftUI-Charts-WWDC2022
//
//  Created by Ivan Pryhara on 8.06.22.
//

import SwiftUI
import Charts


struct Workout: Identifiable {
    var workoutTime: Int
    var date: Date
    
    var id: Date { date }
}

var workouts: [Workout] = [
    .init(workoutTime: 650, date: Date(timeIntervalSinceNow: 86400)),
    .init(workoutTime: 431, date: Date(timeIntervalSinceNow: 86400 * 2)),
    .init(workoutTime: 589, date: Date(timeIntervalSinceNow: 86400 * 3)),
    .init(workoutTime: 862, date: Date(timeIntervalSinceNow: 86400 * 4)),
    .init(workoutTime: 387, date: Date(timeIntervalSinceNow: 86400 * 5)),
    .init(workoutTime: 401, date: Date(timeIntervalSinceNow: 86400 * 6)),
    .init(workoutTime: 520, date: Date(timeIntervalSinceNow: 86400 * 7))
]


struct CupertinoDetails: View {
    var body: some View {

            Chart (workouts) { element in
                BarMark(x: .value("Day", element.date, unit: .weekday),
                              y: .value("Time", element.workoutTime)
                )
            }.padding([.bottom, .top], 200)
            .padding([.leading, .trailing], 30)
            .foregroundColor(.black)
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            
    }
}

struct CupertinoDetails_Previews: PreviewProvider {
    static var previews: some View {
        CupertinoDetails()
    }
}
