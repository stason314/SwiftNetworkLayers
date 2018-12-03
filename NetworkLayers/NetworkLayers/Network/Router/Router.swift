//
//  Router.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 02/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

typealias NetworkRouterCompletion = (_ response: Data) -> Void
typealias NetworkFailureHandler = (_ error: Error?) -> Void

enum NetworkError: String, Error {
    case badUrl = "Bad url"
    case parametersNil = "Params nil"
    case encodingFail = "Encoding failed"
    case noData = "No data from server"
}

protocol NetworkRouter {
    associatedtype EndPoint: EndpointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion, failure: @escaping NetworkFailureHandler)
    func cancel()
}

class Router<EndPoint: EndpointType>: NetworkRouter {
    
    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion, failure: @escaping NetworkFailureHandler) {
        let session = URLSession.shared
        do {
            let request = try buildRequest(fromRoute: route)
            task = session.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    failure(NetworkError.noData)
                    return
                }
                if let error = error {
                    failure(error)
                    return
                }
                completion(data)
            }
        } catch {
            failure(error)
        }
        task?.resume()
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
                append(additionalHeaders: headers, request: &request)
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
    
    private func append(additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        headers.forEach({ request.setValue($0, forHTTPHeaderField: $1) })
    }
}
