//
//  TableViewCell.swift
//  App3
//
//  Created by Vương Toàn Bắc on 5/15/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAc: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
