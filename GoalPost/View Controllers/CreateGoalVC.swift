//
//  CreateGoalVC.swift
//  GoalPost
//
//  Created by Joey Tribbiani on 4/7/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController , UITextViewDelegate {

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
        
        goalTextView.delegate = self
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal ?" {
            guard let finalGoalVC = storyboard?.instantiateViewController(withIdentifier: "finalGoalVC") as? FinalGoalVC else { return }
            finalGoalVC.initData(description: goalTextView.text!, type: goaltype)
            presentDetail(viewControllerToPresent: finalGoalVC)
        }
        
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        goalTextView.text = ""
    }
    
   
    
}
