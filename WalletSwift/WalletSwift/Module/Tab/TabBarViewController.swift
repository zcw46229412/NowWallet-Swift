//
//  TabBarViewController.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/10.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit
import CYLTabBarController
class TabBarViewController: CYLTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self as! UITabBarControllerDelegate
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
