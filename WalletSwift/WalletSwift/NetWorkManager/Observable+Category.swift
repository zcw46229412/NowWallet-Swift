//
//  Observable+Category.swift
//  WalletSwift
//
//  Created by 张春伟 on 2019/6/18.
//  Copyright © 2019 张春伟. All rights reserved.
//

import Foundation

extension Observable{
    func mapObject<T:Mappable>(type: T.Type) -> Observable<T> {
        return self.map { response in
            guard let dict = response as? [String : Any] else{
                throw RxSwiftMoyaError.ParseJSONError
            }
            return Mapper<T>().map(JSON: dict)!
        }
    }
    
    func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return self.map { response in
            //if response is an array of dictionaries, then use ObjectMapper to map the dictionary
            //if not, throw an error
            guard let array = response as? [Any] else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            
            guard let dicts = array as? [[String: Any]] else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            return Mapper<T>().mapArray(JSONArray: dicts)
        }
    }
}

enum RxSwiftMoyaError: String {
    case ParseJSONError
    case OtherError
}
extension RxSwiftMoyaError: Swift.Error { }
