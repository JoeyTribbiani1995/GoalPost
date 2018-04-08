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
        
        self.fetch { (success) in
            if success {
                print("load data")
                if self.goals.count >= 1 {
                    self.tableView.isHidden = false
                    
                }else {
                    self.tableView.isHidden = true
                }
            }
        }
        tableView.reloadData()
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

}

