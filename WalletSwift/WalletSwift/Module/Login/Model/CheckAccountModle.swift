//
//  CheckAccountModle.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/18.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit

class CheckAccountModle: Mappable {
    
    var code: Int = 0
    var message: String?
    var success: String = "0"
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        success <- map["success"]
    }
    

}
