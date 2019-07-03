//
//  BaseLoginViewController.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/5/30.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

class BaseLoginViewController: UIViewController {

    var base_navigationItem: UIView!
    var base_navigationBar: UIView!
    var base_returnBtn: UIButton!
    var base_titleLabel: UILabel!
    var base_desLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = KBgColor()
        self.createNewNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func createNewNavigationBar() -> Void {
        
        
        
        
        
        self.base_navigationBar = UIView.init(frame: CGRect(x: 0, y: 0, width: KSCREEN_WIDTH, height:KNavigationBarHeight()))
        self.view.addSubview(self.base_navigationBar)
        self.base_navigationBar.backgroundColor = KBgColor()
    
        self.base_navigationItem = UIView.init(frame: CGRect.init(x: 0, y: KStatusBarHeight(), width: KSCREEN_WIDTH, height: KNavigationBarHeight() - KStatusBarHeight()))
        self.base_navigationBar.addSubview(self.base_navigationItem)
        self.base_navigationItem.backgroundColor = KBgColor()
        
        self.base_returnBtn = UIButton.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        self.base_navigationItem.addSubview(self.base_returnBtn)
        self.base_returnBtn.setImage(KImageNamed("nav_back"), for: .normal)
        self.base_returnBtn.setImage(KImageNamed("nav_back"), for: .highlighted)
        self.base_returnBtn.addTarget(self, action: #selector(base_popViewController), for: .touchUpInside)
        
        self.base_titleLabel = UILabel.init()
        self.view.addSubview(self.base_titleLabel)
        self.base_titleLabel.font = KFontWithSemibold(34)
        self.base_titleLabel.textColor = UIColor.white
        self.base_titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(KNavigationBarHeight())
            make.left.equalToSuperview().offset(KAdap(20))
        }
        
        self.base_desLabel = UILabel.init()
        self.view.addSubview(self.base_desLabel)
        self.base_desLabel.font = KFontWithMedium(12)
        self.base_desLabel.numberOfLines = 0
        self.base_desLabel.textColor = KRGBColor(red: 142, green: 142, blue: 147)
        self.base_desLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.base_titleLabel.snp.bottom).offset(KAdap(15))
            make.left.equalToSuperview().offset(KAdap(20))
            make.right.equalToSuperview()
        }
        
        
    }
    
    @objc func base_popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
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
