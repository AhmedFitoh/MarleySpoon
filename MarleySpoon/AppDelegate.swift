//
//  AppDelegate.swift
//  MarleySpoon
//
//  Created by AhmedFitoh on 8/31/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setInitialScreen()
        return true
    }

    
    private func setInitialScreen(){
        let recipesListWireframe = RecipesListWireframe()
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = recipesListWireframe.navigationController
        window.makeKeyAndVisible()
    }
    
}

