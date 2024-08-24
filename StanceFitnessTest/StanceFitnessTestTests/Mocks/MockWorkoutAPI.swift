//
//  MockWorkoutAPI.swift
//  StanceFitnessTestTests
//
//  Created by Simon Hopkin on 24/08/2024.
//

import Foundation
@testable import StanceFitnessTest

struct MockWorkoutAPI: WorkoutAPIProtocol {
    
    let mockWorkoutSession: WorkoutSession
    
    func getWorkoutSession() async throws -> StanceFitnessTest.WorkoutSession {
        return mockWorkoutSession
    }
}
