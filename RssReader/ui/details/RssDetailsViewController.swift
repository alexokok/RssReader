//
//  DetailsViewController.swift
//  RssReader
//
//  Created by Alexey Mazaev on 08/02/2019.
//  Copyright © 2019 Alexey Mazaev. All rights reserved.
//

import UIKit
import os.log

class RssDetailsViewController: UIViewController {

    // MARK: - Properties
    var rss: RssInformation?
   
    @IBOutlet weak var placeholder: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeholder.text = "Show RSS with name \(rss?.title ?? "EMPTY")"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
