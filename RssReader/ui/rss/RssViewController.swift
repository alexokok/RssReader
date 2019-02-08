//
//  ViewController.swift
//  RssReader
//
//  Created by Alexey Mazaev on 07/02/2019.
//  Copyright © 2019 Alexey Mazaev. All rights reserved.
//

import UIKit

import os.log

class RssViewController: UIViewController {
    
    //MARK: - Properties
    
    var rss: RssInformation?

    @IBOutlet weak var rssPathTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rssPathTextField.delegate = self
        
        updateSaveButtonState()
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let title = "New RSS"
        let rssUrl = rssPathTextField.text
        
        rss = RssInformation(title: title, rssUrl: rssUrl)
    }
    
    
    @IBAction func onClearClick(_ sender: Any) {
        rssPathTextField.text = nil
        updateSaveButtonState()
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK - Private methods

    private func updateSaveButtonState() {
        let text = rssPathTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
}

extension RssViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        updateSaveButtonState()
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }
    
}
