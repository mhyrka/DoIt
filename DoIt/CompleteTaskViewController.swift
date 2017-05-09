//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by sally white on 5/5/17.
//  Copyright © 2017 Matthew Hyrka. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    let taskDefault : String? = ""
    var task = Task()
    var previousVC = TasksViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskLabel.text = task.name
        
        if task.important == true {
            taskLabel.text = "❗️\(task.name))"
        } else {
            taskLabel.text = task.name
        }


        // Do any additional setup after loading the view.
    }

    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


