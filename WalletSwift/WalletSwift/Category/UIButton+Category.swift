//
//  UIButton+Category.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/11.
//  Copyright © 2019 张春伟. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC.runtime
enum UIButtonImageEdgeInsetsStyle {
    case top, left, right, bottom
}

extension UIButton{
    
    ///图片布局
    func imagePosition(at style: UIButtonImageEdgeInsetsStyle, space: CGFloat){
        
        let imageView = self.imageView
        let titleLabel = self.titleLabel
        
        //获取图片的宽高
        let imageWidth: CGFloat = (imageView?.frame.size.width)!
        let imageHeight: CGFloat = (imageView?.frame.size.height)!
        //获取文字的宽高
        let labelWidth: CGFloat = (titleLabel?.frame.size.width)!
        let labelHeight: CGFloat = (titleLabel?.frame.size.height)!
        
        print(imageWidth,imageHeight)

        print(labelWidth,labelHeight)

        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        switch style {
        case .left:
            //正常状态添加一个边距
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space * 0.5, bottom: 0, right: space * 0.5)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: space * 0.5, bottom: 0, right: -space * 0.5)
            
        case .right:
            //切换位置--左文字右图像
            //图像：UIEdgeInsets的left是相对于UIButton的左边移动了labelWidth + space * 0.5，right相对于label的左边移动了-labelWidth - space * 0.5
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth + space * 0.5, bottom: 0, right: -labelWidth - space * 0.5)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth - space * 0.5, bottom: 0, right: imageWidth + space * 0.5)
        
        case .top:
            //切换位置--上图像下文字
            /**图像的中心位置向右移动了labelWidth * 0.5，向上移动了-imageHeight * 0.5 - space * 0.5
             *文字的中心位置向左移动了imageWidth * 0.5，向下移动了labelHeight*0.5+space*0.5
             */
            imageEdgeInsets = UIEdgeInsets(top: -imageHeight * 0.5 - space * 0.5, left: labelWidth * 0.5, bottom: imageHeight * 0.5 + space * 0.5, right: -labelWidth * 0.5)
            labelEdgeInsets = UIEdgeInsets(top: labelHeight * 0.5 + space * 0.5, left: -imageWidth * 0.5, bottom: -labelHeight * 0.5 - space * 0.5, right: imageWidth * 0.5)
            
        case .bottom:
            //切换位置--下图像上文字
            /**图像的中心位置向右移动了labelWidth * 0.5，向下移动了imageHeight * 0.5 + space * 0.5
             *文字的中心位置向左移动了imageWidth * 0.5，向上移动了labelHeight*0.5+space*0.5
             */
            imageEdgeInsets = UIEdgeInsets(top: imageHeight * 0.5 + space * 0.5, left: labelWidth * 0.5, bottom: -imageHeight * 0.5 - space * 0.5, right: -labelWidth * 0.5)
            labelEdgeInsets = UIEdgeInsets(top: -labelHeight * 0.5 - space * 0.5, left: -imageWidth * 0.5, bottom: labelHeight * 0.5 + space * 0.5, right: imageWidth * 0.5)
        }
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
    
    ///扩充边距
    func enlargeClickArea(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> Void {
        self.hitTestEdgeInsets = UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
    }
    
    ///提供多个运行时的key
    struct RuntimeKey {
        static let buttonKey = UnsafeRawPointer.init(bitPattern: "BTNKey".hashValue)
    }
    ///需要扩充的边距
    var hitTestEdgeInsets: UIEdgeInsets? {
        set {
            objc_setAssociatedObject(self, RuntimeKey.buttonKey!, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
        get {
            return objc_getAssociatedObject(self, RuntimeKey.buttonKey!) as? UIEdgeInsets ?? UIEdgeInsets.zero
        }
    }
    
    ///是否响应
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if UIEdgeInsetsEqualToEdgeInsets(hitTestEdgeInsets!, UIEdgeInsets.zero) || !isEnabled || isHidden {
            return super.point(inside: point, with: event)
        }
        return bounds.inset(by: hitTestEdgeInsets!).contains(point)
    }
}
