//
//  as.swift
//  MYCash-Task
//
//  Created by iOSAYed on 09/01/2024.
//

import Foundation
import Alamofire
import CommonCrypto

protocol Endpoint:URLRequestConvertible {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
}

enum MyCashEndpoint: Endpoint {
        
    case login(parameters:Parameters)

    
    var baseURL:URL {
        return URL(string: MyCashAPIURLs.baseUrl)!
    }
    
    var path:String {
        switch self {
        case .login:
            return MYCashAPIPaths.login
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let params):
            return params
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .login:
            return HTTPHeaders(["Accept":"application/json",
                                "lang":"ar",
                               ])
        }
    }
    
  
        
    func asURLRequest() throws -> URLRequest {
            let url         = baseURL.appendingPathComponent(path)
            var request     = URLRequest(url: url)
            request.method  = method

        switch self {
        case .login:
            request = try URLEncoding.default.encode(request,with: parameters)
        }
        print(request)
            return request
        }
    }
