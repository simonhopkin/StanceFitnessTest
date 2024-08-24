//
//  WorkoutAPI.swift
//  StanceFitnessTest
//
//  Created by Simon Hopkin on 24/08/2024.
//

import Foundation

/// Interacts with the Stance Workout API endpoints
struct WorkoutAPI: WorkoutAPIProtocol {
    
    private let workoutSessionURLString = "https://run.mocky.io/v3/72f399b0-5014-4715-b23e-521a0157d569"
    private let requestTimeout = 30.0 // seconds
    
    func getWorkoutSession() async throws -> WorkoutSession {
        
        // construct a URL
        guard let url = URL(string: workoutSessionURLString) else {
            throw WorkoutSessionAPIError.errorConstructingURL
        }
        
        // create a url request and set the timeout
        var urlRequest = URLRequest(url: url)
        urlRequest.timeoutInterval = requestTimeout
        
        // make the url request
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        // decode the data
        let workout = try JSONDecoder().decode(WorkoutSession.self, from: data)
        
        return workout
    }
}

enum WorkoutSessionAPIError: Error {
    case errorConstructingURL
}
