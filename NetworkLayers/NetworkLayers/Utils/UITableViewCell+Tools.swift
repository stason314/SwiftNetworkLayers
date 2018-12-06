//
//  UITableViewCell+Tools.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 03/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class func nibName() -> String  {
        return String(describing: self)
    }
    
    class func identifier() -> String {
        return String(describing: self)
    }
}
