//
//  MineTableViewCell.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/13.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

class MineTableViewCell: UITableViewCell {
    var titleImgView: UIImageView!
    var titleLabel: UILabel!
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
        self.selectionStyle = .none
        self.contentView.backgroundColor = KBgColor()
        titleImgView = UIImageView.init()
        self.contentView.addSubview(titleImgView)
        titleImgView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(KAdap(20))
        }

        titleLabel = UILabel.init()
        self.contentView.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.font = KFontWithMedium(14)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(KAdap(50))
        }
    }
    
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
