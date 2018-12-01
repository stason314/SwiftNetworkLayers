//
//  Service.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 02/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

typealias Parameter = [String: Any]
typealias HTTPHeaders = [String: String]

enum NetworkError: String, Error {
    case badUrl = "Bad url"
    case parametersNil = "Params nil"
}

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case DELETE = "DELETE"
    case PUT = "PUT"
}

protocol EndpointType {
    var baseUrl: URL { get }
    var httpMethod: HTTPMethod { get }
    var path: String { get }
    var headers: HTTPHeaders { get }
    var httpTask: HTTPTask { get }
}

protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameter) throws
}

enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameter?, urlParameters: Parameter?)
    case requestParametersAndHeaders(bodyParameters: Parameter?, urlParameters: Parameter?, headers: HTTPHeaders?)
}


class Endpoint: NSObject {

}

