//
//  FinalGoalVC.swift
//  GoalPost
//
//  Created by Joey Tribbiani on 4/8/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class FinalGoalVC: UIViewController ,UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var numberTextField: UITextField!
    
    var goalDescription : String!
    var goalType : GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        numberTextField.delegate = self
    }

    @IBAction func createGoalBtnPressed(_ sender: UIButton) {
        
    }
    
    
    func initData(description : String , type : GoalType) {
        self.goalType = type
        self.goalDescription = description
    }
    

}
