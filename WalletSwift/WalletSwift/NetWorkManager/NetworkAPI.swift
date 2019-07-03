//
//  NetworkAPI.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/18.
//  Copyright © 2019 张春伟. All rights reserved.
//

import Foundation
import Moya


enum NetworkAPI {
    /**
     检查账号
     @param region           *国家区号
     @param account          *手机号
     @param expect           *预期结果
     */
    case CheckAccount(region: String, account: String, expect: String)
    
    /**
     登录
     @param service   *目标service地址
     @param username  *用户名
     @param password  *密码
     @param region    *国家区号
     @param imei      *设备号
     @param type      *登录方式：0密码，1短信，2邮箱
     */
    case Login(service: String, username: String, password: String, region: String, imei: String, type: String)
    
    /**
     注册
     @param service     *目标地址
     @param username    *用户名
     @param password    *密码
     @param region      *用户名为手机号时必须 国家区号
     @param smsCode     *短信验证码
     @param type        *注册方式：0手机号，1邮箱
     */
    case Regis(service: String, username: String, password: String, region: String, smsCode: String, type: String)
    
    /**
     发送短信
     @param region      *国家区号
     @param phone       *手机号
     @param type        *0登录操作，1密码操作。2删除设备
     @param signal      *OTC相关系统为false,其他为true
     */
}

extension NetworkAPI: TargetType{
    var baseURL: URL {
        ///测试域名
        return URL.init(string: "https://idtest.imio.ai")!
    }
    
    var path: String {
        switch self {
        case .CheckAccount:
            return "/cas/base/account/check"
        case .Regis:
            return "/cas/base/tickets"
        case .Login:
            return "/cas/base/tickets"
        default:
            break
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .CheckAccount:
            return .get
        default:
            return .post
        }
        return .post
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        var param:[String: Any] = [:]
        switch self {
            
        case .CheckAccount(let region,let account,let expect):
            param["region"] = region
            param["account"] = account
            param["expect"] = expect
            
            //        case let .CheckAccount(region, account, expect):
            //            param["region"] = region
            //            param["account"] = account
            //            param["expect"] = expect
            
        case let .Regis(service, username, password, region, smsCode, type):
            param["service"] = service
            param["username"] = username
            param["password"] = password
            param["region"] = region
            param["smsCode"] = smsCode
            param["type"] = type
            
        case let .Login(service, username, password, region, imei, type):
            param["service"] = service
            param["username"] = username
            param["password"] = password
            param["region"] = region
            param["imei"] = imei
            param["type"] = type
        default:
            return .requestPlain
        }
        DLog("param = \(param)")
        return .requestParameters(parameters: param, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        let header = ["Content-Type" : "application/json; charset=utf-8"]
        return header
    }
    
}
