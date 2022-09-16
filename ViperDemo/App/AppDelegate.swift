//
//  AppDelegate.swift
//  ViperDemo
//
//  Created by P.Nam on 15/09/2022.
//

import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {
    static private(set) var instance: AppDelegate!
    let injection: Injection = .init()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Self.instance = self
        return true
    }
}
