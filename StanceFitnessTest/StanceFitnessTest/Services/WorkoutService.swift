//
//  WorkoutService.swift
//  StanceFitnessTest
//
//  Created by Simon Hopkin on 24/08/2024.
//

import Foundation

struct WorkoutService: WorkoutServiceProtocol {
    
    let workoutAPI: WorkoutAPIProtocol
    
    func getWorkoutSession() async throws -> WorkoutSession {
        return try await workoutAPI.getWorkoutSession()
    }
}
