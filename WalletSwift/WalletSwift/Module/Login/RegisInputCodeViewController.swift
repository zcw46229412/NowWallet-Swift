//
//  RegisInputCodeViewController.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/4.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

class RegisInputCodeViewController: BaseLoginViewController, NumFieldViewDelegate {
    
    let errorLabel: UILabel = UILabel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.base_titleLabel.text =  NSLocalizedString("填写验证码", comment: "")
        self.base_desLabel.text = NSLocalizedString("我们已经向18888888888 \n发送验证码", comment: "")
        self.createViews()
    }
    
    func createViews() -> Void {
        let nums = NumsFieldView.init(frame: .zero, num: 4, secureTextEntry: false)
        nums.delegate = self as NumFieldViewDelegate
        self.view.addSubview(nums)
        nums.snp.makeConstraints { (make) in
            make.top.equalTo(self.base_desLabel.snp.bottom).offset(KAdap(80))
            make.left.equalToSuperview().offset(KAdap(20))
            make.right.equalToSuperview().offset(-KAdap(90))
            make.height.equalTo(KAdap(50))
        }
        
        
        self.view.addSubview(errorLabel)
        errorLabel.textColor = KRGBColor(red: 254, green: 148, blue: 59)
        errorLabel.text = NSLocalizedString("验证码错误", comment: "")
        errorLabel.font = KFontWithMedium(12)
        errorLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(KAdap(20))
            make.top.equalTo(nums.snp.bottom).offset(KAdap(30))
        }
        
    }

    func numsFieldView(numsFieldView: NumsFieldView, finished text: String) {        
        self.navigationController?.pushViewController(SetPwdViewController.init(), animated: true)
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
