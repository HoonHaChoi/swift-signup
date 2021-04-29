//
//  EndPoint.swift
//  SignUp
//
//  Created by HOONHA CHOI on 2021/04/01.
//

import Foundation

enum EndPoint {
    private static let scheme = "https"
    private static let host = "8r6ruzgzve.execute-api.ap-northeast-2.amazonaws.com"
    private static let path = "/default/SwiftCamp"
    
    static var url: URL? {
        var components = URLComponents()
        components.scheme = EndPoint.scheme
        components.host = EndPoint.host
        components.path = EndPoint.path
        return components.url
    }
}
