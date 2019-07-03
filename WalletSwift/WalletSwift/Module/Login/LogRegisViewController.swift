//
//  LogRegisViewController.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/5/30.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit
class LogRegisViewController: UIViewController {

    var logoImage: UIImageView!
    var logBtn: UIButton!
    var regisBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = KBgColor()
        
        self.setNavigationBar()
        self.createUI()
        self.createRX()
        // Do any additional setup after loading the view.
    }
    
    func createRX() -> Void {
        self.regisBtn.rx.tap.subscribe { (event) in
            self.navigationController?.pushViewController(RegisVerifyPhoneViewController.init(), animated: true)
        }.disposed(by: dispostBag)
        
        self.logBtn.rx.tap.subscribe { (event) in
            self.navigationController?.pushViewController(LoginViewController.init(), animated: true)
        }.disposed(by: dispostBag)
    }
    
    func setNavigationBar() -> Void {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    func createUI() -> Void {
        
        //logo
        logoImage = UIImageView()
        logoImage.image = KImageNamed("login_logo")
        self.view.addSubview(logoImage)
        logoImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: KAdap(90), height: KAdap(152)))
            make.top.equalToSuperview().offset(KAdap(110))
        }

        //regis
        regisBtn = UIButton.init()
        self.view.addSubview(regisBtn)
        regisBtn.setTitle(NSLocalizedString("注册", comment: ""), for: .normal)
        regisBtn.setTitleColor(UIColor.white, for: .normal)
        regisBtn.titleLabel?.font = KFontWithSysBold(16)
        regisBtn.setBackgroundImage(KImageNamed("login_regis"), for: .normal)
        regisBtn.setBackgroundImage(KImageNamed("login_regis"), for: .highlighted)
        regisBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: KAdap(295), height: KAdap(40)))
            make.bottom.equalToSuperview().offset(-KBottomAreaHeight() - KAdap(40))
        }

        
        //login
        logBtn = UIButton.init()
        self.view.addSubview(logBtn)
        logBtn.setTitle(NSLocalizedString("登录", comment: ""), for: .normal)
        logBtn.setTitleColor(KBgColor(), for: .normal)
        logBtn.titleLabel?.font = KFontWithSysBold(16)
        logBtn.setBackgroundImage(KImageNamed("login_login"), for: .normal)
        logBtn.setBackgroundImage(KImageNamed("login_login"), for: .highlighted)
        logBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: KAdap(295), height: KAdap(40)))
            make.bottom.equalTo(regisBtn.snp.top).offset(-KAdap(10))
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
