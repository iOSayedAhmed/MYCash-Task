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
    case register(Parameters:Parameters)

    
    var baseURL:URL {
        return URL(string: MyCashAPIURLs.baseUrl)!
    }
    
    var path:String {
        switch self {
        case .login:
            return MYCashAPIPaths.login
        case .register:
            return MYCashAPIPaths.clientRegister
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let params):
            return params
        case .register(Parameters: let Params):
            return Params
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .login , .register:
            return HTTPHeaders(["Accept":"application/json",
                                "lang":"en",
                               ])
        }
    }
    
  
        
    func asURLRequest() throws -> URLRequest {
            let url         = baseURL.appendingPathComponent(path)
            var request     = URLRequest(url: url)
            request.method  = method

        switch self {
        case .login , .register:
            request = try URLEncoding.default.encode(request,with: parameters)
        
        }
        print(request)
            return request
        }
    }
