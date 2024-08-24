//
//  WorkoutRep.swift
//  StanceFitnessTest
//
//  Created by Simon Hopkin on 24/08/2024.
//

import Foundation

struct WorkoutRep: Decodable, Equatable {
    let speed: Double
    let intensity: Double
    let timestamp: Date
}

