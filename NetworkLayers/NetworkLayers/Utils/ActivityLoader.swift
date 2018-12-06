//
//  ActivityLoader.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 03/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

final class ActivityLoader {
    
    private static let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.startAnimating()
        
        return indicator
    }()
    
    private static let activityIndicatorView: UIView = {
        let containerView = UIView(frame: .zero)
        containerView.isUserInteractionEnabled = false
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        containerView.addSubview(indicator)
        return containerView
    }()
    
    static func addLoader() {
        guard let app = UIApplication.shared.delegate, let window = app.window else { return }
        guard let view = window?.rootViewController?.view else { return }
        guard activityIndicatorView.superview == nil else { return }
        view.addSubview(activityIndicatorView)
        activityIndicatorView.frame = view.frame
        
        let originX = (view.frame.size.width / 2) - indicator.frame.size.height / 2
        let originY = (view.frame.size.height / 2) - indicator.frame.size.width / 2
        indicator.frame.origin = CGPoint(x: originX, y: originY)
    }
    
    static func removeLoader() {
        activityIndicatorView.removeFromSuperview()
    }
}
