//
//  LoginViewModel.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/26.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {

//    let userValid: Observable<Bool>
//    let pwdValid: Observable<Bool>
    var userTextField: UITextField!
    var pwdTextField: UITextField!
    
    init(user: UITextField, pwd: UITextField) {
        userTextField = user
        pwdTextField = pwd
        
        let userValid = userTextField.rx.value.orEmpty.distinctUntilChanged().debounce(0.5, scheduler: MainScheduler.instance).map { (text) -> Bool in
            print(text)
            return text.count == 11
            }.share(replay: 1)
        
        userValid.bind(to: pwdTextField.rx.isEnabled).disposed(by: dispostBag)
    }
}
