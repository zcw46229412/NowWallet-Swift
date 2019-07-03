//
//  AppDelegate.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/5/30.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import CYLTabBarController
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window?.backgroundColor = UIColor.white
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        
        let tabBarViewController = TabBarViewController(viewControllers: self.viewControllers(), tabBarItemsAttributes: self.tabBarItemAttributes())
        
        
        //UITabBar.appearance().backgroundColor = .red
        tabBarViewController.tabBar.barTintColor = KRGBColor(red: 16, green: 16, blue: 26)
        tabBarViewController.tabBar.isTranslucent = false
        tabBarViewController.tabBar.tintColor = KRGBColor(red: 254, green: 148, blue: 59)
        
//        self.window?.rootViewController = tabBarViewController
       self.window?.rootViewController = BaseNavigationController(rootViewController: LogRegisViewController.init())

       // UIApplication.shared.statusBarStyle = .lightContent
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        
        if  #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
            //UITableView.appearance().estimatedRowHeight = 0
            UITableView.appearance().estimatedSectionHeaderHeight = 0
            UITableView.appearance().estimatedSectionFooterHeight = 0
        }
        
        
        
        self.window?.makeKeyAndVisible()
        return true
    }

    
    func viewControllers() -> [UINavigationController] {
        let home = BaseNavigationController(rootViewController: HomeViewController.init())
        let financila = BaseNavigationController(rootViewController: FinancialViewController.init())
        let mine = BaseNavigationController(rootViewController: MineViewController.init())
        let viewController = [home, financila, mine]
        return viewController
    }
    
    func tabBarItemAttributes() -> [[String: String]] {
        let tabBarItemHome = [CYLTabBarItemTitle: "首页",
                              CYLTabBarItemImage: "tabbar_home",
                              CYLTabBarItemSelectedImage: "tabbar_home_selected"]
        
        let tabbarItemFinancial = [CYLTabBarItemTitle: "理财",
                                   CYLTabBarItemImage: "tabbar_financial",
                                   CYLTabBarItemSelectedImage: "tabbar_financial_selected"]
        
        let tabbarItemMine = [CYLTabBarItemTitle: "我的",
                                   CYLTabBarItemImage: "tabbar_mine",
                                   CYLTabBarItemSelectedImage: "tabbar_mine_selected"]
        
        let attributes = [tabBarItemHome, tabbarItemFinancial, tabbarItemMine]
        
        return attributes
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

