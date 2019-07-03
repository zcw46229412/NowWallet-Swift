//
//  HomeFinancialTableViewCell.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/13.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

class HomeFinancialTableViewCell: UITableViewCell {

    var titleLabel: UILabel!
    var rateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let bgView = UIView.init()
        self.contentView.addSubview(bgView)
        self.contentView.backgroundColor = KBgColor()
        self.selectionStyle = .none
        bgView.layer.masksToBounds = true
        bgView.layer.cornerRadius = KAdap(4)
        bgView.backgroundColor = KRGBColor(red: 46, green: 47, blue: 71)
        bgView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 15, left: 20, bottom: 0, right: 20))
            make.height.equalTo(KAdap(120))
        }
        
        titleLabel = UILabel.init()
        bgView.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.font = KFontWithMedium(16)
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(KAdap(10))
        }
        
        rateLabel = UILabel.init()
        bgView.addSubview(rateLabel)
        rateLabel.textColor = KRGBColor(red: 245, green: 166, blue: 35)
        rateLabel.font = KFontWithMedium(34)
        rateLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(KAdap(10))
            make.top.equalToSuperview().offset(KAdap(45))
        }
        
        let pointLabel = UILabel.init()
        bgView.addSubview(pointLabel)
        pointLabel.textColor = KRGBColor(red: 156, green: 158, blue: 185)
        pointLabel.font = KFontWithMedium(12)
        pointLabel.snp.makeConstraints { (make) in
            make.left.equalTo(rateLabel.snp.right).offset(KAdap(13))
            make.top.equalTo(rateLabel.snp.centerY)
        }
        pointLabel.text = NSLocalizedString("预计年化收益率", comment: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
