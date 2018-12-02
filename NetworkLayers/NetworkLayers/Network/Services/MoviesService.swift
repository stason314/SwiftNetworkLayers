//
//  MoviesService.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 02/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

class MoviesService {
    static let shared = MoviesService()
    private let router = Router<MoviesApi>()
    
    typealias MoviesCompletionHandler = (_ movies: [Movie]?, _ error: Error?) -> Void
    
    func getMovies(byPage page: Int, completion: @escaping MoviesCompletionHandler) {
        router.request(.upcoming(page: page)) { (data, response, error) in
            
        }
    }
}
