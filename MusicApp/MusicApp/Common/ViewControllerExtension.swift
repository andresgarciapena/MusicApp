//
//  ViewControllerExtension.swift
//  MusicApp
//
//  Created by Andres Garcia on 12/03/2021.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTapAnywhere() {
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
