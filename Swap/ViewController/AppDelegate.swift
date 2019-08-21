//
//  AppDelegate.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-28.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
    
    let participantPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/participants.txt"
    let participantsController = ParticipantsController()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if let tabBarViewController = window?.rootViewController as? TabBarViewController {
            tabBarViewController.participantsController = self.participantsController
        }
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        self.participantsController.save()
        
        if let tabBar = self.window?.rootViewController as? TabBarViewController, let result = tabBar.selectedViewController as? ResultsViewController {
            result.dismiss(animated: false, completion: nil)
            if result.topView.isHidden {
                let viewController = UIViewController()
                viewController.view.backgroundColor = UIColor(red: 76/255, green: 94/255, blue: 138/255, alpha: 1.0)
                
                let image = UIImage(named: "LaunchScreenIcon")
                let imageView = UIImageView(image: image)
                imageView.center = viewController.view.center
                
                viewController.view.addSubview(imageView)
                
                self.window?.rootViewController?.present(viewController, animated: false, completion: nil)
            }
            
            if let swap = result.swap {
                swap.reroll = false
            }
        }
        
    }

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        self.window?.rootViewController?.dismiss(animated: false, completion: nil)
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        self.participantsController.save()
    }


}

