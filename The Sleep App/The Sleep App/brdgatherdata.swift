////
////  brdgatherdata.swift
////  The Sleep App
////
////  Created by Iyad Hassan on 5/17/23.
////
//
//import Foundation
//import UIKit
//import HealthKit
//
//class SleepViewController: UIViewController {
//
//    @IBOutlet weak var timeInBedLabel: UILabel!
//    @IBOutlet weak var timeAsleepLabel: UILabel!
//    @IBOutlet weak var sleepStagesLabel: UILabel!
//    @IBOutlet weak var restlessSleepLabel: UILabel!
//    @IBOutlet weak var awakeningsLabel: UILabel!
//    @IBOutlet weak var heartRateLabel: UILabel!
//    @IBOutlet weak var respiratoryRateLabel: UILabel!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Request access to HealthKit
//        let healthStore = HKHealthStore()
//        healthStore.requestAuthorization(toShare: nil, read: [
//            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.sleepAnalysis)!,
//            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
//            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.respiratoryRate)!
//        ]) { (success, error) in
//            if success {
//                // Start collecting sleep data
//                self.startCollectingSleepData()
//            } else {
//                // Handle error
//                print(error?.localizedDescription ?? "Unknown error")
//            }
//        }
//    }
//
//    func startCollectingSleepData() {
//        // Create a sleep query
//        let sleepQuery = HKQuery(predicate: HKQueryPredicate(format: "date >= %@", Date().startOfDay as NSDate),
//                                   healthKitObjectType: HKObjectType.sleepAnalysis())
//
//        // Set the query's results handler
//        sleepQuery.resultsHandler = { (query, results, error) in
//            if let results = results as? [HKSleepAnalysis] {
//                // Update the UI with the latest sleep data
//                self.updateUI(with: results)
//            } else {
//                // Handle error
//                print(error?.localizedDescription ?? "Unknown error")
//            }
//        }
//
//        // Add the query to the health store
//        healthStore.execute(sleepQuery)
//    }
//
//    func updateUI(with results: [HKSleepAnalysis]) {
//        // Get the total time in bed
//        let totalTimeInBed = results.reduce(0) { $0 + $1.duration }
//
//        // Get the total time asleep
//        let totalTimeAsleep = results.reduce(0) { $0 + $1.totalSleepTime }
//
//        // Get the sleep stages
//        let sleepStages = results.map { $1.sleepStages }.reduce([]) { $0 + $1 }
//
//        // Get the restless sleep
//        let restlessSleep = results.reduce(0) { $0 + $1.restlessSleep }
//
//        // Get the awakenings
//        let awakenings = results.reduce(0) { $0 + $1.awakenings }
//
//        // Get the heart rate
//        let heartRate = results.map { $1.heartRate }.reduce(0) { $0 + $1 }
//
//        // Get the respiratory rate
//        let respiratoryRate = results.map { $1.respiratoryRate }.reduce(0) { $0 + $1 }
//
//        // Update the UI
//        timeInBedLabel.text = "\(totalTimeInBed) seconds"
//        timeAsleepLabel.text = "\(totalTimeAsleep) seconds"
//        sleepStagesLabel.text = "\(sleepStages)"
//        restlessSleepLabel.text = "\(restlessSleep) seconds"
//        awakeningsLabel.text = "\(awakenings)"
//        heartRateLabel.text = "\(heartRate) beats per minute"
//        respiratoryRateLabel.text = "\(respiratoryRate) breaths per minute"
//    }
//}
