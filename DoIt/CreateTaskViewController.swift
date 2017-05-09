//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by sally white on 5/4/17.
//  Copyright © 2017 Matthew Hyrka. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        // Create a Task form the outlet information
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // initializes variable 'context' to access AppDelegate code and Core Data. Standard Code
        
        let task = Task(context: context)
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        // Pop back
        
        // Add new task to array in previous viewController
        
        
        navigationController?.popViewController(animated: true)
    }
    
    
}
