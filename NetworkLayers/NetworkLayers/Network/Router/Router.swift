//
//  Router.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 02/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

class Router<EndPoint: EndpointType>: NetworkRouter {
    
    private var task: URLSessionTask?
    
    typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try buildRequest(fromRoute: route)
            session.dataTask(with: request) { (data, response, error) in
                completion(data, response, error)
            }
        } catch {
            completion(nil, nil, error)
        }
        
    }
    
    func cancel() {
        task?.cancel()
    }
    
    private func buildRequest(fromRoute route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseUrl.appendingPathComponent(route.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            switch route.httpTask {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters, let urlParameters):
                try configureParams(bodyParameters: bodyParameters, urlParameters: urlParameters, urlRequest: &request)
            case .requestParametersAndHeaders(let bodyParameters, let urlParameters, let headers):
                appendTo(request: &request, additionalHeaders: headers)
                try configureParams(bodyParameters: bodyParameters, urlParameters: urlParameters, urlRequest: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    private func configureParams(bodyParameters: Parameters?, urlParameters: Parameters?, urlRequest: inout URLRequest) throws {
        do {
            if let bodyParams = bodyParameters {
                try JsonParameterEncoder.encode(urlRequest: &urlRequest, with: bodyParams)
            }
            if let urlParams = urlParameters {
                try UrlParameterEncoder.encode(urlRequest: &urlRequest, with: urlParams)
            }
        } catch {
            throw error
        }
    }
    
    private func appendTo(request: inout URLRequest, additionalHeaders: HTTPHeaders?) {
        guard let headers = additionalHeaders else { return }
        headers.forEach({ request.setValue($0, forHTTPHeaderField: $1) })
    }
}
