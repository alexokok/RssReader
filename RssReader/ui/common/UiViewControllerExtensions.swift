//
//  UiViewControllerExtensions.swift
//  RssReader
//
//  Created by Alexey Mazaev on 07/02/2019.
//  Copyright © 2019 Alexey Mazaev. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showInformationPopup(popupTitle: String?, popupMessage: String?) {
        let alertController = UIAlertController(title: popupTitle, message: popupMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertController, animated: true)
    }
    
    func showErrorPopup(errorMessage: String) {
        let alertController = UIAlertController(title: "Ooops", message: errorMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
