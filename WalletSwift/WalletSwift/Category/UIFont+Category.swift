//
//  Tool+Category.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/5/30.
//  Copyright © 2019 张春伟. All rights reserved.
//

import Foundation
import UIKit

extension UIFont{
    enum FontName {
        case Semibold
        case Heavy
        case Medium
        case Regular
        case SystemBold
    }
    
   class func fontWithSize(name: FontName, size: CGFloat) -> UIFont {
        
        switch name {
        case .Semibold:
            return UIFont.init(name: "PingFangSC-Semibold", size: size)!
        case .Heavy:
            return UIFont.init(name: "PingFangSC-Ultralight", size: size)!
        case .Medium:
            return UIFont.init(name: "PingFangSC-Medium", size: size)!
        case .Regular:
            return UIFont.init(name: "PingFangSC-Regular", size: size)!
        case .SystemBold:
            return UIFont.boldSystemFont(ofSize: size)
        }
    }
}
