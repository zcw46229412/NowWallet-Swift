//
//  AreaCodeTableViewCell.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/5/31.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

class AreaCodeTableViewCell: UITableViewCell {

    var areaLabel: UILabel!
    var codeLalbel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = KRGBColor(red: 51, green: 51, blue: 64)
        self.selectionStyle = .none
        
        areaLabel = UILabel.init()
        self.contentView.addSubview(areaLabel)
        areaLabel.textColor = .white
        areaLabel.font = KFontWithMedium(14)
        areaLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(KAdap(15))
        }
        
        codeLalbel = UILabel.init()
        self.contentView.addSubview(codeLalbel)
        codeLalbel.textColor = .white
        codeLalbel.font = KFontWithMedium(14)
        codeLalbel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-KAdap(5))
        }
        
        let lineView = UIView.init()
        lineView.backgroundColor = KRGBColor(red: 44, green: 45, blue: 46)
        self.contentView.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(KAdap(15))
            make.right.equalToSuperview().offset(-KAdap(0))
            make.height.equalTo(KAdap(1))
        }
        
    }
    
    
    func showModelInfo(_ model: AreaCodeModel) -> Void {
        areaLabel.text = model.zh_hans
        codeLalbel.text = "+" + model.country_code!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
