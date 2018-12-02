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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension MoviesViewController: UITableViewDelegate {
    
}
