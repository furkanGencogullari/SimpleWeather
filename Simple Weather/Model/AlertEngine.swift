//
//  Alert.swift
//  Simple Weather
//
//  Created by Furkan Gençoğulları on 20.01.2023.
//

import UIKit

struct AlertEngine {
    static func createErrorAlert(title: String, error: Error) -> UIAlertController {
        let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        return alert
    }
    static func createErrorAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        return alert
    }
}
