//
//  RssInfoViewCell.swift
//  RssReader
//
//  Created by Alexey Mazaev on 07/02/2019.
//  Copyright © 2019 Alexey Mazaev. All rights reserved.
//

import UIKit

class RssTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var rssImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
