//
//  MovieTableViewCell.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 03/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var movieTitleLabel: UILabel!
    
    var movie: Movie? {
        didSet {
            refreshUI()
        }
    }
    
    private func refreshUI() {
        guard let movie = movie else { return }
        movieTitleLabel.text = movie.title
    }
}
