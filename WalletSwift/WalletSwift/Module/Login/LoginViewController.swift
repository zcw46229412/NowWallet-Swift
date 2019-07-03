//
//  LoginViewController.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/6.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

class LoginViewController: BaseLoginViewController {

    var phoneTextField: UITextField = UITextField.init()
    var pwdTextField: UITextField = UITextField.init()
    var areaLabel: UILabel = UILabel.init()
    var commitBtn: UIButton = UIButton.init()
    var areaTap: UITapGestureRecognizer!

    var phoneErrorLabel:UILabel = UILabel.init()
    var pwdErrorLabel: UILabel = UILabel.init()
    
    var logViewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.base_titleLabel.text = NSLocalizedString("登录", comment: "")
        
        self.createViews()
        
        self.createErrorLabel()
        
        self.createRX()
    }
    
    func createRX() -> Void {
        
        //logViewModel = LoginViewModel.init(user: phoneTextField, pwd: pwdTextField)
        
        
        //Observable.interval(1, scheduler: MainScheduler.instance).
        
        var b = true
        Observable<Int>.interval(1, scheduler: MainScheduler.instance).takeWhile { (num) -> Bool in
            return num < 10
            }.subscribe { (int) in
                print(int.element as Any)
                if(int.element == 10){
                    b = false
                }
                if int.element != nil{
                    print("asdf")
                }
        }.disposed(by: dispostBag)
        
        Observable<Int>.interval(1, scheduler: MainScheduler.instance).observeOn(<#T##scheduler: ImmediateSchedulerType##ImmediateSchedulerType#>)
        
        let userValid = phoneTextField.rx.text.orEmpty.map { (string) -> Bool in
            return string.count == 11
            }.share(replay: 1)
        
        
        phoneTextField.rx.value.orEmpty.map { (text) -> String in
            return text
        }.bind(to: pwdErrorLabel.rx.text).disposed(by: dispostBag)
        

        userValid.bind(to: pwdTextField.rx.isEnabled).disposed(by: dispostBag)

        userValid.bind(to: phoneErrorLabel.rx.isHidden).disposed(by: dispostBag)


        let pwdValid = pwdTextField.rx.text.orEmpty.map { (string) -> Bool in
            return string.count == 6
            }.share(replay: 1)

        pwdValid.bind(to: pwdErrorLabel.rx.isHidden).disposed(by: dispostBag)


        let everyValid = Observable.combineLatest(userValid, pwdValid){a,b in
            return a && b
            }.share(replay: 1)

        everyValid.bind(to: commitBtn.rx.isEnabled).disposed(by: dispostBag)
    }
    
    func createErrorLabel() -> Void {
        self.view.addSubview(phoneErrorLabel)
        phoneErrorLabel.text = "phone error"
        phoneErrorLabel.textColor = .red
        phoneErrorLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }

        self.view.addSubview(pwdErrorLabel)
        pwdErrorLabel.text = "pwd error"
        pwdErrorLabel.textColor = .red
        pwdErrorLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.snp.centerY).offset(20)
        }

        
        commitBtn.rx.tap.subscribe { (event) in
            let alert = UIAlertView(title: "alert", message: "message alert", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }.disposed(by: dispostBag)
        
    }
    
    func createViews() -> Void {
        self.view.addSubview(phoneTextField)
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.keyboardType = UIKeyboardType.numberPad
        phoneTextField.backgroundColor = KRGBColor(red: 51, green: 51, blue: 64)
        phoneTextField.placeholder = NSLocalizedString("请输入手机号", comment: "")
        phoneTextField.textColor = UIColor.white
        phoneTextField.font = KFontWithMedium(12)
        phoneTextField.becomeFirstResponder()
        phoneTextField.clearButtonMode = .always
        phoneTextField.setValue(KRGBColor(red: 142, green: 142, blue: 147), forKeyPath: "_placeholderLabel.textColor")
        phoneTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(KAdap(20))
            make.right.equalToSuperview().offset(-KAdap(20))
            make.top.equalTo(self.base_titleLabel.snp.bottom).offset(KAdap(36))
            make.height.equalTo(KAdap(KAdap(50)))
        }
        
        phoneTextField.leftViewMode = .always
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: KAdap(70), height: KAdap(50)))
        phoneTextField.leftView = leftView
        
        areaLabel = UILabel.init()
        leftView.addSubview(areaLabel)
        areaLabel.textColor = UIColor.white
        areaLabel.font = KFontWithSemibold(18)
        areaLabel.textAlignment = .center
        areaLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
        }
        areaLabel.text = "+ 86"
        areaLabel.isUserInteractionEnabled = true
        areaTap = UITapGestureRecognizer.init()
        areaLabel.addGestureRecognizer(areaTap)
        
        
        let lineView = UIView.init()
        lineView.backgroundColor = KRGBColor(red: 39, green: 39, blue: 53)
        areaLabel.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview().offset(0)
            make.width.equalTo(KAdap(1))
        }
        
        
        self.view.addSubview(pwdTextField)
        pwdTextField.borderStyle = .roundedRect
        pwdTextField.backgroundColor = KRGBColor(red: 51, green: 51, blue: 64)
        pwdTextField.placeholder = NSLocalizedString("请输入登录密码", comment: "")
        pwdTextField.textColor = UIColor.white
        pwdTextField.font = KFontWithMedium(12)
        pwdTextField.becomeFirstResponder()
        pwdTextField.clearButtonMode = .always
        pwdTextField.isSecureTextEntry = true
        pwdTextField.setValue(KRGBColor(red: 142, green: 142, blue: 147), forKeyPath: "_placeholderLabel.textColor")
        pwdTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(KAdap(20))
            make.right.equalToSuperview().offset(-KAdap(20))
            make.top.equalTo(phoneTextField.snp.bottom).offset(KAdap(10))
            make.height.equalTo(KAdap(KAdap(50)))
        }
        pwdTextField.leftViewMode = .always
        pwdTextField.leftView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: KAdap(20), height: KAdap(50)))
        
        
        commitBtn = UIButton.init()
        self.view.addSubview(commitBtn)
        commitBtn.setBackgroundImage(KImageNamed("regis_bg_verify"), for: .normal)
        commitBtn.setBackgroundImage(KImageNamed("regis_bg_verify"), for: .highlighted)
        commitBtn.titleLabel?.font = KFontWithSysBold(16)
        commitBtn.setTitle(NSLocalizedString("一切就绪", comment: ""), for: .normal)
        commitBtn.setTitleColor(.white, for: .normal)
        commitBtn.snp.makeConstraints { (make) in
            make.top.equalTo(phoneTextField.snp.bottom).offset(KAdap(127))
            make.left.equalToSuperview().offset(KAdap(20))
            make.size.equalTo(CGSize(width: KAdap(120), height: KAdap(40)))
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
