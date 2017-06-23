//
//  AppDelegate.swift
//  SimpleNetworkLayer
//
//  Created by Inacio Ferrarini on 23/06/17.
//  Copyright © 2017 com.inacioferrarini. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let client = FinancialApiClient()
        client.rates.all(completionBlock: { (rates) in
            print("\(String(describing: rates))")
        }) { (error) in
            print("error: \(error)")
        }
        
        return true
    }
    
}

