//
//  SetPwdViewController.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/5.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

class SetPwdViewController: BaseLoginViewController {

    var pwdTextField: UITextField = UITextField.init()
    var repeatTextField: UITextField = UITextField.init()
    let commitBtn: UIButton = UIButton.init()
    let errorLabel = UILabel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.base_titleLabel.text = NSLocalizedString("密码设置", comment: "")
        self.base_desLabel.text = NSLocalizedString("密碼長度8~16位，包含字母和數字", comment: "")
        
        self.createViews()
    }
    
    func createViews() -> Void {
        self.view.addSubview(pwdTextField)
        self.view.addSubview(repeatTextField)
        
        pwdTextField.backgroundColor = KRGBColor(red: 51, green: 51, blue: 64)
        pwdTextField.borderStyle = .roundedRect
        pwdTextField.leftViewMode = .always
        pwdTextField.clearButtonMode = .always
        pwdTextField.isSecureTextEntry = true
        pwdTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: KAdap(20), height: KAdap(50)))
        pwdTextField.placeholder = NSLocalizedString("输入密码", comment: "")
        pwdTextField.setValue(KRGBColor(red: 142, green: 142, blue: 147), forKeyPath: "_placeholderLabel.textColor")
        pwdTextField.font = KFontWithMedium(12)
        pwdTextField.textColor = .white
        pwdTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(KAdap(20))
            make.right.equalToSuperview().offset(-KAdap(20))
            make.top.equalTo(self.base_desLabel.snp.bottom).offset(KAdap(35))
            make.height.equalTo(KAdap(50))
        }
        
        repeatTextField.backgroundColor = KRGBColor(red: 51, green: 51, blue: 64)
        repeatTextField.borderStyle = .roundedRect
        repeatTextField.leftViewMode = .always
        repeatTextField.clearButtonMode = .always
        repeatTextField.isSecureTextEntry = true
        repeatTextField.placeholder = NSLocalizedString("确认一次", comment: "")
        repeatTextField.setValue(KRGBColor(red: 142, green: 142, blue: 147), forKeyPath: "_placeholderLabel.textColor")
        repeatTextField.font = KFontWithMedium(12)
        repeatTextField.textColor = .white
        repeatTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: KAdap(20), height: KAdap(50)))
        repeatTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(KAdap(20))
            make.right.equalToSuperview().offset(-KAdap(20))
            make.top.equalTo(pwdTextField.snp.bottom).offset(KAdap(10))
            make.height.equalTo(KAdap(50))
        }
        
        self.view.addSubview(commitBtn)
        commitBtn.setBackgroundImage(KImageNamed("regis_bg_verify"), for: .normal)
        commitBtn.setBackgroundImage(KImageNamed("regis_bg_verify"), for: .highlighted)
        commitBtn.setTitle("确定", for: .normal)
        commitBtn.setTitleColor(.white, for: .normal)
        commitBtn.titleLabel?.font = KFontWithSysBold(16)
        commitBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: KAdap(120), height: KAdap(40)))
            make.left.equalToSuperview().offset(KAdap(20))
            make.top.equalTo(repeatTextField.snp.bottom).offset(KAdap(67))
        }
        
        self.view.addSubview(errorLabel)
        errorLabel.textColor = KRGBColor(red: 254, green: 148, blue: 59)
        errorLabel.text = NSLocalizedString("两次密码不一致", comment: "")
        errorLabel.font = KFontWithMedium(12)
        errorLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(KAdap(20))
            make.top.equalTo(repeatTextField.snp.bottom).offset(KAdap(30))
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
