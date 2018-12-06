//
//  AlertUtils.swift
//  NetworkLayers
//
//  Created by Стас Клюхин on 03/12/2018.
//  Copyright © 2018 Стас Клюхин. All rights reserved.
//

import UIKit

final class AlertUtils {

    static func showErrorAlert(withMessage message: String) {
        showAlert(withTitle: "Error", message: message)
    }
    
    static func showAlert(withTitle title: String, message: String) {
        guard let app = UIApplication.shared.delegate, let window = app.window else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
