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
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    func congfiureCell(goal : Goal) {
        goalProgressLbl.text = "\(goal.goalProgress)"
        goalTypeLbl.text = goal.goalType
        goalDescriptionLbl.text = goal.goalDescription
        
        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden = false
        }else {
            self.completionView.isHidden = true
        }
        
    }

}
