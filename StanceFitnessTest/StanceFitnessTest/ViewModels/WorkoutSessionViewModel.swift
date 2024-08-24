//
//  WorkoutSessionViewModel.swift
//  StanceFitnessTest
//
//  Created by Simon Hopkin on 24/08/2024.
//

import Foundation

class WorkoutSessionViewModel {
    
    // Observables
    @Published private(set) var workoutSession: WorkoutSession?
    @Published private(set) var error: Error?
    
    // Models
    private let workoutService: WorkoutServiceProtocol
    
    init(workoutService: WorkoutServiceProtocol) {
        self.workoutService = workoutService
    }
    
    func getWorkout() async {
        do {
            self.workoutSession = try await workoutService.getWorkoutSession()
        }
        catch {
            self.error = error
        }
    }
}
