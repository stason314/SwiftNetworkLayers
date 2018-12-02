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
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
    }
    
    func cancel() {
        task?.cancel()
    }
}
