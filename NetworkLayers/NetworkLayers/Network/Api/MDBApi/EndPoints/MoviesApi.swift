//
//  MoviesApi.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 02/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

let kMoviesApiKey = "b9d024fa6790c4238ae6b322f08e5577"

enum MoviesApi {
    case popular(page: Int)
    case simular(id: String)
    case video(id: String)
    case upcoming(page: Int)
}

extension MoviesApi: EndpointType {
    
    var apiKeyParameter: Parameters {
        return ["api_key": kMoviesApiKey]
    }
    
    var baseUrl: URL {
        let urlString = "https://api.themoviedb.org/3/movie/"
        guard let url = URL(string: urlString) else { fatalError("Bad url") }
        return url
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .popular, .simular, .upcoming, .video:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .upcoming:
            return "upcoming"
        default:
            return ""
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var httpTask: HTTPTask {
        var params = apiKeyParameter
        switch self {
        case .upcoming(let page):
            params["page"] = page
            return .requestParameters(bodyParameters: nil, urlParameters: params)
        default:
            return .request
        }
    }
    
    
}
