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
    
    let workoutSessionView = WorkoutSessionView()
    let activityIndicator = UIActivityIndicatorView()

    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialiseView()
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Task {
            await viewModel.getWorkout()
        }
    }
    
    private func initialiseView() {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = String(localized: "workoutSession")
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        
        view.addSubview(titleLabel)
        
        workoutSessionView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(workoutSessionView)
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        workoutSessionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        workoutSessionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        workoutSessionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        workoutSessionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        view.addSubview(activityIndicator)
        activityIndicator.style = .large
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func setupBindings() {
        viewModel.$workoutSession
            .compactMap{$0}
            .receive(on: DispatchQueue.main)
            .sink { [weak self] workoutSession in
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
                self?.workoutSessionView.configureView(workoutSession: workoutSession)
            }
            .store(in: &cancellables)
        
        viewModel.$error
            .receive(on: DispatchQueue.main)
            .compactMap{$0}
            .sink { [weak self] error in
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
                self?.displayErrorMessage(error: error)
            }
            .store(in: &cancellables)
    }
    
    private func displayErrorMessage(error: Error) {
        let alert = UIAlertController(title: String(localized: "workoutSessionErrorTitle"),
                                      message: String(localized: "workoutSessionErrorMessage"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: String(localized: "ok").uppercased(), style: .default))
        present(alert, animated: true, completion: nil)
    }
}

