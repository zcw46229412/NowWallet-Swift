//
//  AreaCodeHeaderView.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/3.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

class AreaCodeHeaderView: UITableViewHeaderFooterView {
    var titleLabel: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = KRGBColor(red: 255, green: 255, blue: 255, alpha: 0.2)
        
        titleLabel = UILabel.init()
        self.contentView.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.font = KFontWithMedium(17)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(KAdap(15))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
