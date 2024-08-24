//
//  WorkoutSet.swift
//  StanceFitnessTest
//
//  Created by Simon Hopkin on 24/08/2024.
//

import Foundation

struct WorkoutSet: Decodable {
    let timestamp: Date
    let reps: [WorkoutRep]
}
