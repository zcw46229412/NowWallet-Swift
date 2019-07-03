//
//  BaseNavigationController.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/5/31.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController,UINavigationControllerDelegate,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //导航栏背景颜色
        
        //导航标题文字
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 19)
        ]
        
        //添加手势代理
        self.interactivePopGestureRecognizer?.delegate = self
        self.delegate = self
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            //添加手势识别
            self.interactivePopGestureRecognizer?.isEnabled = true
            self.hidesBottomBarWhenPushed = true
        }else{
            self.hidesBottomBarWhenPushed = false
        }
        //是否开启动画由传入决定，不会造成冲突
        super.pushViewController(viewController, animated: animated)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if navigationController.viewControllers.count == 1 {
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
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
