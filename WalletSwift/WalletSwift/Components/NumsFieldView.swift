//
//  NumsFieldView.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/4.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

@objc protocol NumFieldViewDelegate: NSObjectProtocol {
    @objc optional func numsFieldView(numsFieldView: NumsFieldView,finished text: String) -> Void
}

class NumsFieldView: UIView, UITextFieldDelegate {
    var num: Int = 4
    var textArray = [UITextField]()
    var secureTextEntry = false
    var mainTextField = UITextField.init()
    weak var delegate: NumFieldViewDelegate?
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createMainTextField()
    }
    
    
    required init(frame: CGRect, num: Int = 4, secureTextEntry: Bool = false) {
        super.init(frame: frame)
        self.num = num
        self.secureTextEntry = secureTextEntry
        
        self.createMainTextField()
    }
    
    
    func createMainTextField() -> Void {
        self.clipsToBounds = true
        for _ in 0..<num {
            let textField = UITextField.init()
            self.addSubview(textField)
            textField.keyboardType = .numberPad
            textField.textAlignment = .center
            textField.textColor = .white
            textField.font = KFontWithSemibold(18)
            textField.isEnabled = false
            textField.isSecureTextEntry = self.secureTextEntry
            textField.layer.cornerRadius = KAdap(5)
            textField.backgroundColor = KRGBColor(red: 51, green: 51, blue: 64)
            textArray.append(textField)
        }
        
        self.addSubview(mainTextField)
        mainTextField.keyboardType = .numberPad
        mainTextField.tintColor = .clear
        mainTextField.becomeFirstResponder()
        mainTextField.textColor = .clear
        mainTextField.delegate = self as UITextFieldDelegate
        mainTextField.addTarget(self, action: #selector(textFieldValueChanged(textField:)), for: .editingChanged)
    }
    
    @objc func textFieldValueChanged(textField: UITextField) -> Void {
        
        for i in 0..<textArray.count {
            let field: UITextField = textArray[i]
            field.text = ""
        }
        
        for i in 0..<textField.text!.count {
            let char = textField.text!.index(textField.text!.startIndex, offsetBy: i)
            let field: UITextField = textArray[i]
            field.text = String(textField.text![char])
        }
        
        
        if textField.text!.count == num {
            delegate?.numsFieldView?(numsFieldView: self, finished: textField.text!)
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        if textField.text!.count >= num{
            if string == ""{
                return true
            }
            return false
        }else{
            return true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width: CGFloat = self.frame.size.width
        let height: CGFloat = self.frame.size.height
        
        mainTextField.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        
        //
        let leadind: CGFloat = (width - height * CGFloat(num)) / CGFloat((num - 1))
        if leadind > 0 {
            for i in 0..<textArray.count{
                let textField: UITextField = textArray[i]
                textField.frame = CGRect.init(x: CGFloat(CGFloat(i) * (leadind + height)), y: 0, width: height, height: height)
            }
        }else{
            //leading不够，默认5
            let tempHeight = CGFloat((width - KAdap(5) * CGFloat((num - 1)))) / CGFloat(num)
            print(tempHeight)
            for i in 0..<textArray.count{
                let textField: UITextField = textArray[i]
                textField.frame = CGRect.init(x: CGFloat(CGFloat(i) * (KAdap(5) + tempHeight)), y: 0, width: tempHeight, height: tempHeight)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
