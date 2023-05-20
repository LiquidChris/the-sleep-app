////
////  healthkit authorization.swift
////  The Sleep App
////
////  Created by Iyad Hassan on 5/17/23.
////
//
//import Foundation
//import HealthKit
//
//let healthStore = HKHealthStore()
//
//func requestHealthKitAuthorization() {
//    let typesToRead: Set<HKObjectType> = [
//        HKObjectType.quantityType(forIdentifier: .heartRate)!,
//        HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
//    ]
//    
//    healthStore.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
//        if let error = error {
//            print("HealthKit authorization failed: \(error.localizedDescription)")
//        } else {
//            if success {
//                print("HealthKit authorization succeeded!")
//            } else {
//                print("HealthKit authorization denied.")
//            }
//        }
//    }
//}
