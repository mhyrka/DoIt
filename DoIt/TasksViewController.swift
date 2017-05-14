//
//  TasksViewController.swift
//  DoIt
//
//  Created by sally white on 5/4/17.
//  Copyright © 2017 Matthew Hyrka. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    } // gets called every time view controller is about to show up on screen

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let taskOptional = ""
        let task = tasks[indexPath.row]
        if task.important == true {
            cell.textLabel?.text = "❗️\(task.name ?? taskOptional)"
        } else {
            cell.textLabel?.text = task.name!
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
            } catch {
                print("There's an error")
        }
                
            
    
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
            }
        }
    }
}

