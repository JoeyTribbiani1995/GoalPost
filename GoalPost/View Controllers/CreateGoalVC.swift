//
//  CreateGoalVC.swift
//  GoalPost
//
//  Created by Joey Tribbiani on 4/7/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    
    var goaltype : GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectColor()
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
    }
   
    @IBAction func longTermBtnPressed(_ sender: UIButton) {
        goaltype = .longTerm
        shortTermBtn.setDeselectColor()
        longTermBtn.setSelectedColor()
    }
    
    @IBAction func shortTermBtnPressed(_ sender: UIButton) {
        goaltype = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectColor()
    }
    
}
