//
//  NetworkManager.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/14.
//  Copyright © 2019 张春伟. All rights reserved.
//

import Foundation
import Moya
//import Alamofire
///超时时间
private var requestTimeOut: Double = 30
///设置是否显示loading
private var isLoaing: Bool = true

let myEndpointClosure = {(target: NetworkAPI) -> Endpoint in
    
    let url = target.baseURL.absoluteString + target.path
    switch target {
    case .CheckAccount:
        DLog("chect")
        requestTimeOut = 20
        isLoaing = true
    default:
        DLog("default")
        isLoaing = true
    }
    return Endpoint(url: url, sampleResponseClosure: { .networkResponse(200, target.sampleData) }, method: target.method, task: target.task, httpHeaderFields: target.headers)
}

//设置请求超时时间
let requestTimeoutClosure = { (endpoint: Endpoint, done: @escaping MoyaProvider<NetworkAPI>.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        request.timeoutInterval = requestTimeOut
        done(.success(request))
    } catch {
        return
    }
}



let networkPlugin = NetworkActivityPlugin.init { (changeType, target) in
    
    switch changeType{
    case .began:
        if isLoaing{
            DLog("加载loading")
        }
        
    case .ended:
        if isLoaing{
            DLog("隐藏loading")
        }
    }
    
}



///没有设置超时
let NetworkProvider = MoyaProvider<NetworkAPI>()

//设置了超时时间的
let NetworkProviderOutTime = MoyaProvider<NetworkAPI>(endpointClosure:myEndpointClosure, requestClosure: requestTimeoutClosure, plugins: [networkPlugin])
