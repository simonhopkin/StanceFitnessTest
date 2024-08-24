//
//  WorkoutSessionView.swift
//  StanceFitnessTest
//
//  Created by Simon Hopkin on 24/08/2024.
//

import Foundation
import UIKit

class WorkoutSessionView: UIScrollView {
    
    let stackView = UIStackView()
    
    init() {
        super.init(frame: .zero)
        initialiseView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialiseView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialiseView()
    }
    
    private func initialiseView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor, constant: -10).isActive = true
        stackView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor, constant: -20).isActive = true
    }
    
    func configureView(workoutSession: WorkoutSession) {
        for (index, workoutSet) in workoutSession.sets.enumerated() {
            let workoutSetChartView = WorkoutSetChartView()
            workoutSetChartView.heightAnchor.constraint(equalToConstant: 250).isActive = true
            workoutSetChartView.configureView(workoutSet: workoutSet, setNumber: index + 1)
            stackView.addArrangedSubview(workoutSetChartView)
        }
    }
}
