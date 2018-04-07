//
//  GoalCell.swift
//  GoalPost
//
//  Created by Joey Tribbiani on 4/7/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var gooalDescriptionLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func congfiureCell(description : String , type : GoalType , progress : Int ) {
        goalProgressLbl.text = "\(progress)"
        goalTypeLbl.text = type.rawValue
        gooalDescriptionLbl.text = description
    }

}
