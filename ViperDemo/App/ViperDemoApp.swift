//
//  ViperDemoApp.swift
//  ViperDemo
//
//  Created by P.Nam on 15/09/2022.
//

import SwiftUI

@main
struct ViperDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                UsersPage()
                    .environment(\.usersPresentation, appDelegate.injection.usersPresentation)
            }
        }
    }
}
