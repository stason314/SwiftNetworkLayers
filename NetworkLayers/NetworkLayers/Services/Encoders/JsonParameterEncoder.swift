//
//  JsonParameterEncoder.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 02/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

class JsonParameterEncoder: ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameter) throws {
        do {
            let json = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = json
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            throw NetworkError.encodingFail
        }
    }
}
