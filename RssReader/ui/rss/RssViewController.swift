//
//  ViewController.swift
//  RssReader
//
//  Created by Alexey Mazaev on 07/02/2019.
//  Copyright © 2019 Alexey Mazaev. All rights reserved.
//

import UIKit

class RssViewController: UIViewController {

    @IBOutlet weak var rssPathTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func onSaveClick(_ sender: Any) {
        if let rssText = rssPathTextField.text {
            if !rssText.isEmpty {
                showInformationPopup(popupTitle: "Save result", popupMessage: "Save rss with address: \(rssText)")
            } else {
                showErrorPopup(errorMessage: "We can't save this RSS because address is empty")
            }
        }
    }
    
    @IBAction func onClearClick(_ sender: Any) {
        rssPathTextField.text = nil
    }
    
}
