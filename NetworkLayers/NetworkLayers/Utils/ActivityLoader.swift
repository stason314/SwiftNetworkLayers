//
//  ActivityLoader.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 03/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

final class ActivityLoader {
    
    private static let activityIndicatorView: UIView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        let containerView = UIView(frame: .zero)
        containerView.isUserInteractionEnabled = false
        containerView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.6)
        containerView.tag = 501
        containerView.addSubview(indicator)
        indicator.startAnimating()
        return containerView
    }()
    
    static func addLoader(to view: UIView) {
        view.addSubview(activityIndicatorView)
    }
    
    static func removeLoader() {
        activityIndicatorView.removeFromSuperview()
    }
}
