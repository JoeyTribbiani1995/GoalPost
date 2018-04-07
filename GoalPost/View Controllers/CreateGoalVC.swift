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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
    }
   
    @IBAction func longTermBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func shortTermBtnPressed(_ sender: UIButton) {
    }
    
}
