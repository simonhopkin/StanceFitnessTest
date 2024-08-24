//
//  WorkoutSession.swift
//  StanceFitnessTest
//
//  Created by Simon Hopkin on 24/08/2024.
//

import Foundation

struct WorkoutSession: Decodable, Equatable {
    let sets: [WorkoutSet]
    
    static func == (lhs: WorkoutSession, rhs: WorkoutSession) -> Bool {
        lhs.sets == rhs.sets
    }
}
