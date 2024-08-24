//
//  ViewController.swift
//  StanceFitnessTest
//
//  Created by Simon Hopkin on 24/08/2024.
//

import UIKit
import Combine

class ViewController: UIViewController {

    let viewModel = WorkoutSessionViewModel(workoutService: WorkoutService(workoutAPI: WorkoutAPI()))
    
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Task {
            await viewModel.getWorkout()
        }
    }

    private func setupBindings() {
        viewModel.$workoutSession
            .compactMap{$0}
            .sink { workoutSession in
                print(workoutSession)
            }
            .store(in: &cancellables)
    }
}

