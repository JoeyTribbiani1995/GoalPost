//
//  FinalGoalVC.swift
//  GoalPost
//
//  Created by Joey Tribbiani on 4/8/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit
import CoreData

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
        if numberTextField.text != "" {
            self.save { (success) in
                if success {
                    
                }
            }
        }
    }
    
    
    func initData(description : String , type : GoalType) {
        self.goalType = type
        self.goalDescription = description
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
    func save(completion : (_ success : Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(numberTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
        } catch {
            debugPrint("Could not save : \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
