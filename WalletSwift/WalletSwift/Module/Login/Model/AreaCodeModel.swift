//
//  AreaCodeModel.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/3.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit
class AreaCodeModel: Mappable {
    
    var country_code: String?
    var en: String?
    @objc var zh_hans: String?
    var zh_hant: String?
    @objc var name: String?

    
    func mapping(map: Map) {
        country_code <- map["country_code"]
        en <- map["en"]
        zh_hans <- map["zh_hans"]
        zh_hant <- map["zh_hant"]
        name <- map["zh_hans"]
    }
    
    required init?(map: Map) {
        
    }
    
    
    
}
