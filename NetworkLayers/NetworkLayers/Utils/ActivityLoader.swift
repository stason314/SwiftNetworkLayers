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
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        let containerView = UIView(frame: .zero)
        containerView.isUserInteractionEnabled = false
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        containerView.addSubview(indicator)
        indicator.frame.origin = containerView.frame.origin
        indicator.startAnimating()
        return containerView
    }()
    
    static func addLoader(to view: UIView) {
        view.addSubview(activityIndicatorView)
        activityIndicatorView.frame = view.frame
    }
    
    static func removeLoader() {
        activityIndicatorView.removeFromSuperview()
    }
}
