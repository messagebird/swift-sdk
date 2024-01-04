//
//  AppDelegate.swift
//  PushNotificationsExample
//
//  Created by Meena Alfons on 13/12/2023.
//

import Foundation
import UIKit
import BirdKit

class AppDelegate: NSObject, UIApplicationDelegate {
    static var bird: Bird? = nil
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        AppDelegate.bird = Bird(workspaceId: "blah")
        
        return true
    }
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        
        print("didRegisterForRemoteNotificationsWithDeviceToken")
        AppDelegate.bird?.notifications.registerDevice(deviceToken: deviceToken)
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        print("didFailToRegisterForRemoteNotificationsWithError")
        print(error)
    }
}
