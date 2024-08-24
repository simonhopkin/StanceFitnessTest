//
//  WorkoutSessionAPIProtocol.swift
//  StanceFitnessTest
//
//  Created by Simon Hopkin on 24/08/2024.
//

import Foundation

protocol WorkoutSessionAPIProtocol {
    func getWorkoutSession() async throws -> WorkoutSession
}
