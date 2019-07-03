//
//  FilePCH.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/5/30.
//  Copyright © 2019 张春伟. All rights reserved.
//

import UIKit
@_exported import SnapKit
@_exported import RxSwift
@_exported import RxCocoa
@_exported import ObjectMapper
@_exported import HandyJSON
@_exported import SwiftyJSON


/** RxSwift回收池*/
let dispostBag = DisposeBag()

/** 屏幕的宽度*/
let KSCREEN_WIDTH = UIScreen.main.bounds.size.width

/** 屏幕高度*/
let KSCREEN_HEIGHT = UIScreen.main.bounds.size.height

/** 自适应大小*/
func KAdap(_ float: CGFloat) -> CGFloat {
    return float/375.0 * KSCREEN_WIDTH
}

/** RGB颜色*/
func KRGBColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
    return UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
}

/** Hex颜色*/
func KHexColor(hex: String, alpha: CGFloat = 1) -> UIColor {
    return UIColor.colorFromHex(hexString: hex, alpha: alpha)
}

/** 随机颜色*/
func KRandomColor() -> UIColor {
    return UIColor.init(red: CGFloat((arc4random() % 255)) / 255.0, green: CGFloat((arc4random() % 255)) / 255.0, blue: CGFloat((arc4random() % 255)) / 255.0, alpha: 1)
}

/** 背景颜色*/
func KBgColor() -> UIColor {
    return KRGBColor(red: 25, green: 26, blue: 42)
}

/** Semibold字体*/
func KFontWithSemibold(_ size: CGFloat) -> UIFont {
    return UIFont.fontWithSize(name: .Semibold, size: KAdap(size))
}

/** Heavy字体*/
func KFontWithHeavy(_ size: CGFloat) -> UIFont {
    return UIFont.fontWithSize(name: .Heavy, size: KAdap(size))
}

/** Medium字体*/
func KFontWithMedium(_ size: CGFloat) -> UIFont {
    return UIFont.fontWithSize(name: .Medium, size: KAdap(size))
}

/** Regular字体*/
func KFontWithRegular(_ size: CGFloat) -> UIFont {
    return UIFont.fontWithSize(name: .Regular, size: KAdap(size))
}

/** SysBold字体*/
func KFontWithSysBold(_ size: CGFloat) -> UIFont {
    return UIFont.fontWithSize(name: .SystemBold, size: KAdap(size))
}

/** 返回图片*/
func KImageNamed(_ name: String) -> UIImage {
    return UIImage.init(named: name) ?? UIImage.init()
}

/** 底部安全区域*/
func KBottomAreaHeight() -> CGFloat {
    return KSCREEN_HEIGHT > 812 ? 34 : 0
}

/** StatusBar高度*/
func KStatusBarHeight() -> CGFloat {
    return KSCREEN_HEIGHT > 812 ? 44 : 20
}

/** NavigationBar高度*/
func KNavigationBarHeight() -> CGFloat {
    return KStatusBarHeight() + 40
}

/** 安全区域高度*/
func KSafeAreaHeight() -> CGFloat {
    return KSCREEN_HEIGHT - KBottomAreaHeight() - KNavigationBarHeight()
}

// MARK: - 封装的日志输出功能（T表示不指定日志信息参数类型）
func DLog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line){
    #if DEBUG
    //获取文件名
    let fileName = (file as NSString).lastPathComponent
    // 创建一个日期格式器
    let dformatter = DateFormatter()
    // 为日期格式器设置格式字符串
    dformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    // 使用日期格式器格式化当前日期、时间
    let datestr = dformatter.string(from: Date())
    //打印日志内容
    //print("***** start *****")
    //print(datestr)
    print("\(datestr) fileName: \(fileName) -> line: \(line) -> func: \(function)")
    print(message)
    //print("***** end *****")
    print("      ")
    print("      ")

    #endif
}
