//
//  AppDelegate.swift
//  PushNotificationsExample
//
//  Created by Meena Alfons on 13/12/2023.
//

import os
import Foundation
import UIKit

import BirdKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    static var bird: Bird!
    static let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "AppDelegate")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        do {
            Self.bird = try Bird()
        } catch {
            Self.logger.info("failed to create bird \(error)")
        }
        
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    // This method will be called from Button "Ask for notifications permission"
    static func requestNotificationsPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]) { granted, error in
            guard granted else {
                self.logger.log("Notification permission is not gratned")
                return
            }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }

    }
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        Self.bird.notifications.registerDevice(deviceToken: deviceToken)
        
        Self.logger.log("APNS token: \(deviceToken.map { String(format: "%02x", $0) }.joined())")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        Self.logger.log(#function)
    }
    
    
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {
        Self.bird.notifications.applicationDidReceiveRemoteNotification(userInfo: userInfo, completionHandler: completionHandler)
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        Self.logger.log(#function)
        let options = Self.bird.notifications.willPresentNotification(notification)
        completionHandler(options)
    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        Self.logger.log(#function)
        Self.bird.notifications.didReceiveResponse(response)
        completionHandler()
    }
}
