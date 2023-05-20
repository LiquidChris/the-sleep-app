////
////  gatherdata.swift
////  The Sleep App
////
////  Created by Iyad Hassan on 5/17/23.
////
//import HealthKit
//import Foundation
//func collectHeartRateData() {
//    guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
//        print("Heart rate data type is not available.")
//        return
//    }
//    
//    let heartRateQuery = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
//        if let error = error {
//            print("Error retrieving heart rate samples: \(error.localizedDescription)")
//            return
//        }
//        
//        guard let heartRateSamples = samples as? [HKQuantitySample] else {
//            return
//        }
//        
//        // Process heart rate samples
//        for sample in heartRateSamples {
//            let heartRate = sample.quantity.doubleValue(for: HKUnit.count().unitDivided(by: HKUnit.minute()))
//            let timestamp = sample.startDate
//            
//            // Store or process the heart rate data as needed
//            print("Heart Rate: \(heartRate), Timestamp: \(timestamp)")
//        }
//    }
//    
//    healthStore.execute(heartRateQuery)
//}
//
//func collectSleepData() {
//    guard let sleepAnalysisType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
//        print("Sleep analysis data type is not available.")
//        return
//    }
//    
//    let sleepQuery = HKSampleQuery(sampleType: sleepAnalysisType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
//        if let error = error {
//            print("Error retrieving sleep samples: \(error.localizedDescription)")
//            return
//        }
//        
//        guard let sleepSamples = samples as? [HKCategorySample] else {
//            return
//        }
//        
//        // Process sleep samples
//        for sample in sleepSamples {
//            let sleepValue = sample.value == HKCategoryValueSleepAnalysis.inBed.rawValue ? "In Bed" : "Asleep"
//            let startDate = sample.startDate
//            let endDate = sample.endDate
//            
//            // Store or process the sleep data as needed
//            print("Sleep Value: \(sleepValue), Start Date: \(startDate), End Date: \(endDate)")
//        }
//    }
//    
//    healthStore.execute(sleepQuery)
//}
