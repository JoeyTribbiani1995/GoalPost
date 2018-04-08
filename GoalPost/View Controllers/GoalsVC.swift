//
//  GoalsVC.swift
//  GoalPost
//
//  Created by Joey Tribbiani on 4/7/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController ,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var goals : [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchLoadData()
        tableView.reloadData()
    }
    
    func fetchLoadData() {
       fetch { (success) in
            if success {
                print("load data")
                if self.goals.count >= 1 {
                    self.tableView.isHidden = false
                    
                }else {
                    self.tableView.isHidden = true
                }
            }
        }
    }

    @IBAction func addGoalBtnPressed(_ sender: UIButton) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "createGoalVC") else { return }
        presentDetail(viewControllerToPresent: createGoalVC)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell {
            
            let goal = goals[indexPath.row]
            cell.congfiureCell(goal: goal)
            
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func fetch(completion : @escaping CompletionHandler){
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try manageContext.fetch(fetchRequest)
            completion(true)
        }catch {
            debugPrint("Could not fetch : ",error.localizedDescription)
            completion(false)
        }
    }
    
    func removeGoal(atIndexPath indexPath : IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        managedContext.delete(goals[indexPath.row])
        do {
            try managedContext.save()
        }catch {
            debugPrint("could not remove :\(error.localizedDescription)")
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchLoadData()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let progressAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexPath) in
            self.setProgress(atIndexPath: indexPath)
            self.fetchLoadData()
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        progressAction.backgroundColor = #colorLiteral(red: 0.9771530032, green: 0.7062081099, blue: 0.1748393774, alpha: 1)
        
        return [deleteAction,progressAction]
    }
    
    func setProgress( atIndexPath indexPath : IndexPath) {
        guard let manageContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let chosenGoal = goals[indexPath.row]
        
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue {
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        }else {
            return
        }
        
        do {
            try manageContext.save()
        }catch {
            debugPrint("could not set progress : \(error.localizedDescription)")
        }
    }

}

