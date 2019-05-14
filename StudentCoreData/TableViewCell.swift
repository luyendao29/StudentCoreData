//
//  TableViewCell.swift
//  StudentCoreData
//
//  Created by Boss on 4/18/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var lbname: UILabel!
    
    @IBOutlet weak var lbage: UILabel!
    
    @IBOutlet weak var lbphone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
