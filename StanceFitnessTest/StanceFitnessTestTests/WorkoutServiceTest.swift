//
//  WorkoutServiceTest.swift
//  StanceFitnessTestTests
//
//  Created by Simon Hopkin on 24/08/2024.
//

import XCTest
@testable import StanceFitnessTest

final class WorkoutServiceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWorkoutServiceReceivesData() async throws {
        
        let mockWorkoutSession = WorkoutSession(sets: [
            WorkoutSet(timestamp: Date.now, reps: [
                WorkoutRep(speed: 1, intensity: 10, timestamp: Date.now),
                WorkoutRep(speed: 2, intensity: 11, timestamp: Date.now)
            ]),
            WorkoutSet(timestamp: Date.now, reps: [
                WorkoutRep(speed: 3, intensity: 12, timestamp: Date.now),
                WorkoutRep(speed: 4, intensity: 13, timestamp: Date.now)
            ]),
            WorkoutSet(timestamp: Date.now, reps: [
                WorkoutRep(speed: 5, intensity: 14, timestamp: Date.now),
                WorkoutRep(speed: 6, intensity: 15, timestamp: Date.now)
            ]),
        ])
        
        let mockWorkoutAPI = MockWorkoutAPI(mockWorkoutSession: mockWorkoutSession)
        
        let workoutService = WorkoutService(workoutAPI: mockWorkoutAPI)
        
        let actualWorkoutSession = try await workoutService.getWorkoutSession()
        
        XCTAssertEqual(mockWorkoutSession, actualWorkoutSession)
    }


}
