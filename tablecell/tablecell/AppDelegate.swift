//
//  AppDelegate.swift
//  tablecell
//
//  Created by Larry on 7/2/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    class var shared: AppDelegate {
      return UIApplication.shared.delegate as! AppDelegate
    }

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window?.makeKeyAndVisible()
        
        self.window?.rootViewController = ViewController()
        return true
    }


}

