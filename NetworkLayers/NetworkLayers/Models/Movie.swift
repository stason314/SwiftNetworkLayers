//
//  Movie.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 02/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

struct MoviesApiResponse {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let movies: [Movie]
}

extension MoviesApiResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case movies = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        page = try container.decode(Int.self, forKey: .page)
        totalPages = try container.decode(Int.self, forKey: .totalPages)
        totalResults = try container.decode(Int.self, forKey: .totalResults)
        movies = try container.decode([Movie].self, forKey: .movies)
    }
}

struct Movie {
    let id: String
    let voteCount: Int
    let voteAverage: Double
    let haveVideo: Bool
    let title: String
    let posterPath: String
    let overview: String
}
extension Movie: Decodable {
    private enum MovieCodingKeys: String, CodingKey {
        case id
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
        case title
        case posterPath = "poster_path"
        case overview
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        voteCount = try container.decode(Int.self, forKey: .voteCount)
        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        haveVideo = try container.decode(Bool.self, forKey: .video)
        title = try container.decode(String.self, forKey: .title)
        posterPath = try container.decode(String.self, forKey: .posterPath)
        overview = try container.decode(String.self, forKey: .overview)
    }
}
