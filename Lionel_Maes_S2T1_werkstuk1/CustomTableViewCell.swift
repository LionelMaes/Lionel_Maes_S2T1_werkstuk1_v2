//
//  CustomTableViewCell.swift
//  Lionel_Maes_S2T1_werkstuk1
//
//  Created by MAES Lionel (s) on 27/04/2018.
//  Copyright © 2018 MAES Lionel (s). All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var imgPerson: UIImageView!
    @IBOutlet weak var lblPerson: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
