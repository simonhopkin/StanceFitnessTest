//
//  WorkoutSet.swift
//  StanceFitnessTest
//
//  Created by Simon Hopkin on 24/08/2024.
//

import Foundation

struct WorkoutSet: Decodable, Equatable {
    let timestamp: Date
    let reps: [WorkoutRep]
    
    static func == (lhs: WorkoutSet, rhs: WorkoutSet) -> Bool {
        lhs.timestamp == rhs.timestamp &&
        lhs.reps == rhs.reps
    }
}
