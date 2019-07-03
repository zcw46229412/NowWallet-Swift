//
//  RegisVerifyPhoneViewController.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/5/31.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

class RegisVerifyPhoneViewController: BaseLoginViewController {
    
    var phoneTexField: UITextField!
    var areaLabel: UILabel!
    var verifyBtn: UIButton!
    
    var areaTap: UITapGestureRecognizer!
    
    let str : String = "2123"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        // Do any additional setup after loading the view.
        self.createViews()
        self.createRX()
    }
    
    func createRX() -> Void {
        areaLabel.text = "+ 86"
        areaTap.rx.event.subscribe { (event) in
            print("tapClick")
            //self.navigationController?.pushViewController(RegisAreaCodeViewController(), animated: true)
        }.disposed(by: dispostBag)
        
//        verifyBtn.rx.tap.subscribe { (event) in
//            print("verifyClick")
//            NetworkProvider.request(.CheckAccount(region: "86", account: "18888824132", expect: "0"), completion: { (result) in
//                DLog(result)
//                switch result{
//                case .success(let success):
//                    let json = JSON.init(success.data)
//                    DLog(json)
//                case .failure(let failure):
//                    DLog(failure)
//                }
//            })
//            //self.navigationController?.pushViewController(RegisInputCodeViewController(), animated: true)
//        }.disposed(by: dispostBag)
        
        
        
        NetworkProvider.rx.request(.CheckAccount(region: "86", account: "18888824132", expect: "0")).mapJSON().asObservable().mapObject(type: CheckAccountModle.self).subscribe(onNext: { (model) in
            DLog(model)
        }, onError: { (error) in
            print("error")
        }, onCompleted: {
            DLog("completed")
        }) {
            
        }.disposed(by: dispostBag)
        
        
        
//        NetworkProvider.rx.request(.CheckAccount(region: "86", account: "18888824132", expect: "0")).mapJSON().subscribe(onSuccess: { (success) in
//            print("success = \(success)")
//        }) { (error) in
//            print("error = \(error)")
//        }.disposed(by: dispostBag)
//        
//        NetworkProvider.rx.request(.CheckAccount(region: "86", account: "18888824132", expect: "1")).mapJSON().subscribe(onSuccess: { (success) in
//            print("success = \(success)")
//        }) { (error) in
//            print("error = \(error)")
//        }.disposed(by: dispostBag)
        
//        NetworkProviderOutTime.rx.request(.CheckAccount(region: "86", account: "18888824132", expect: "1")).mapJSON().subscribe(onSuccess: { (success) in
//            DLog(success)
//        }) { (error) in
//            DLog(error.localizedDescription)
//        }.disposed(by: dispostBag)
        
        
    }
    
    func createViews(){
        self.base_titleLabel.text = NSLocalizedString("注册", comment: "")
        self.base_desLabel.text = NSLocalizedString("请输入您的手机号", comment: "")
        
        phoneTexField = UITextField.init()
        self.view.addSubview(phoneTexField)
        phoneTexField.borderStyle = .roundedRect
        phoneTexField.keyboardType = UIKeyboardType.numberPad
        phoneTexField.backgroundColor = KRGBColor(red: 51, green: 51, blue: 64)
        phoneTexField.placeholder = NSLocalizedString("请输入手机号", comment: "")
        phoneTexField.textColor = UIColor.white
        phoneTexField.font = KFontWithMedium(12)
        phoneTexField.becomeFirstResponder()
        phoneTexField.clearButtonMode = .always
        phoneTexField.setValue(KRGBColor(red: 142, green: 142, blue: 147), forKeyPath: "_placeholderLabel.textColor")
        phoneTexField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(KAdap(20))
            make.right.equalToSuperview().offset(-KAdap(20))
            make.top.equalTo(self.base_desLabel.snp.bottom).offset(KAdap(36))
            make.height.equalTo(KAdap(KAdap(50)))
        }
        
        phoneTexField.leftViewMode = .always
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: KAdap(80), height: KAdap(50)))
        phoneTexField.leftView = leftView
        
        areaLabel = UILabel.init()
        leftView.addSubview(areaLabel)
        areaLabel.textColor = UIColor.white
        areaLabel.font = KFontWithSemibold(18)
        areaLabel.textAlignment = .center
        areaLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
        }
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
        
        verifyBtn = UIButton.init()
        self.view.addSubview(verifyBtn)
        verifyBtn.setBackgroundImage(KImageNamed("regis_bg_verify"), for: .normal)
        verifyBtn.setBackgroundImage(KImageNamed("regis_bg_verify"), for: .highlighted)
        verifyBtn.titleLabel?.font = KFontWithSysBold(16)
        verifyBtn.setTitle(NSLocalizedString("验证", comment: ""), for: .normal)
        verifyBtn.setTitleColor(.white, for: .normal)
        verifyBtn.snp.makeConstraints { (make) in
            make.top.equalTo(phoneTexField.snp.bottom).offset(KAdap(90))
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
