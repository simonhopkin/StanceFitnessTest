//
//  WorkoutSetChartView.swift
//  StanceFitnessTest
//
//  Created by Simon Hopkin on 24/08/2024.
//

import Foundation
import UIKit
import DGCharts

class WorkoutSetChartView: UIView {
    
    private let setNumberLabel = UILabel()
    private let setTimeLabel = UILabel()
    private let chart = LineChartView()
    
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
        setNumberLabel.font = UIFont.systemFont(ofSize: 18)
        
        setNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        setTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        chart.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(setNumberLabel)
        addSubview(setTimeLabel)
        addSubview(chart)
        
        setNumberLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        setNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        setTimeLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        setTimeLabel.leadingAnchor.constraint(equalTo: setNumberLabel.trailingAnchor).isActive = true
        setTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        chart.topAnchor.constraint(equalTo: setNumberLabel.bottomAnchor, constant: 10).isActive = true
        chart.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        chart.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        chart.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        chart.isUserInteractionEnabled = false
        
        chart.xAxis.drawGridLinesEnabled = false
        chart.xAxis.labelPosition = .bottom
        
        chart.leftAxis.axisMinimum = 0
        chart.leftAxis.axisMaximum = 1
        
        chart.rightAxis.enabled = false
    }
    
    func configureView(workoutSet: WorkoutSet, setNumber: Int) {
        
        setNumberLabel.text = "\(String(localized: "set").uppercased()) \(setNumber)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        setTimeLabel.text = "\(dateFormatter.string(from: workoutSet.timestamp))"
        let yValues = workoutSet.reps.map{$0.speed}
        let dataEntries = yValues.enumerated().map{ ChartDataEntry(x: Double($0.offset), y: $0.element) }
        let dataSet = LineChartDataSet(entries: dataEntries, label: "Speed")
        
        dataSet.drawCircleHoleEnabled = false
        dataSet.circleRadius = 5
        
        let data = LineChartData(dataSet: dataSet)
        
        // make sure no intermediate xAxis labels are shown
        chart.xAxis.labelCount = workoutSet.reps.count - 1
        
        chart.data = data
    }
    
}
