//
//  AppDelegate.swift
//  testbot
//
//  Created by Hills, Dennis on 10/26/18.
//  Copyright © 2018 Hills, Dennis. All rights reserved.
//
// Latest docs: https://docs.aws.amazon.com/en_us/aws-mobile/latest/developerguide/how-to-ios-lex.html
// Mobile Hub docs:
// https://docs.aws.amazon.com/aws-mobile/latest/developerguide/mobile-hub-add-aws-mobile-conversational-bots.html#mobile-hub-add-aws-mobile-conversational-bots-app

import UIKit
import AWSMobileClient

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // AWS SDK logging
        AWSDDLog.sharedInstance.logLevel = .debug // set to .off for production
        AWSDDLog.add(AWSDDTTYLogger.sharedInstance) // Log to console (TTY = Xcode console)
        
        return AWSMobileClient.sharedInstance().interceptApplication(
            application, didFinishLaunchingWithOptions:
            launchOptions)
    }
    
    // NEW function added for AWSMobileClient call in application:open url
    func application(_ application: UIApplication, open url: URL,
                     sourceApplication: String?, annotation: Any) -> Bool {
        
        return AWSMobileClient.sharedInstance().interceptApplication(
            application, open: url,
            sourceApplication: sourceApplication,
            annotation: annotation)
    }

    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
}

