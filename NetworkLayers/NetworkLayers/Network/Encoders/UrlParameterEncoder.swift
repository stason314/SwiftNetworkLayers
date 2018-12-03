//
//  UrlParameterEncoder.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 02/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

class UrlParameterEncoder: ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.badUrl }
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            
            let encodedQueryItems = parameters.map { (key, value) -> URLQueryItem in
                let encodedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                let queryItem = URLQueryItem(name: key, value: encodedValue)
                return queryItem
            }
            
            urlComponents.queryItems = encodedQueryItems
            urlRequest.url = urlComponents.url
        }
        urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
    }
}
