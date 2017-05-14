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
    var task : Task? = nil
    var previousVC = TasksViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task?.important == true {
            taskLabel.text = "❗️\(String(describing: task?.name))"
        } else {
            taskLabel.text = task?.name
        }


        // Do any additional setup after loading the view.
    }

    @IBAction func completeTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
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


