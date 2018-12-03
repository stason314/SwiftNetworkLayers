//
//  ViewController.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 01/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var movies: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadMovies() {
        ActivityLoader.addLoader(to: view)
        MoviesService.shared.getMovies(byPage: 0) { [weak self] (movies, error) in
            guard let `self` = self else { return }
            DispatchQueue.main.async {
                if let error = error {
                    AlertUtils.showErrorAlert(withMessage: error.localizedDescription)
                } else if let movies = movies {
                    self.movies = movies
                    self.tableView.reloadData()
                }
                ActivityLoader.removeLoader()
            }

        }
    }

}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension MoviesViewController: UITableViewDelegate {
    
}
