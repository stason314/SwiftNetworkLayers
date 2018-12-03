//
//  UITableViewCell+Tools.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 03/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var nibName: String  {
        return String(describing: self)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
