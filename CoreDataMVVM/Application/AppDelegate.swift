//
//  AppDelegate.swift
//  CoreDataMVVM
//
//  Created by Serhii Syrotynin on 7/13/17.
//  Copyright © 2017 Serhii Syrotynin. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
//        CoreDataManager.shared.allUsers(success: { (people) in
//            for var participant in people {
//                print("Found \(participant.name)")
//            }
//        }) { (error) in
//            print(error?.localizedDescription ?? "")
//        }
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        CoreDataManager.shared.saveContext()
    }
}

