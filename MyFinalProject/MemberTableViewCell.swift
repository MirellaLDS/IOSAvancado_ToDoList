//
//  MemberTableViewCell.swift
//  MyFinalProject
//
//  Created by Halyson Ribeiro Pessoa on 12/01/2019.
//  Copyright © 2019 Halyson Ribeiro Pessoa. All rights reserved.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    @IBOutlet weak var myMember: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
