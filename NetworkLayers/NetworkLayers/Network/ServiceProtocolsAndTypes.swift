//
//  ServiceProtocolsAndTypes.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 02/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

typealias Parameters = [String: Any]
typealias HTTPHeaders = [String: String]

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
    var headers: HTTPHeaders? { get }
    var httpTask: HTTPTask { get }
}

protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, headers: HTTPHeaders?)
}
