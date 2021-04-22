//
//  AddItemsViewController.swift
//  ToDoList
//
//  Created by ESHITA on 27/09/19.
//  Copyright © 2019 ESHITA. All rights reserved.
//

import UIKit

class AddItemsViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    var todotableVC : TodoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func addButton(_ sender: Any) {
        
        if let name = nameTextfield.text {
            if name.isEmpty{
                // create the alert
                let alert = UIAlertController(title: "", message: "Opps!!! please enter any item.", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }else{
                
                if let context = (UIApplication.shared.delegate as?
                    AppDelegate)?.persistentContainer.viewContext{
                    let newToDo = ToDodata(context: context)
                    newToDo.importantData = importantSwitch.isOn
                    if let name = nameTextfield.text {
                        newToDo.nameData = name
                    }
                    (UIApplication.shared.delegate as?
                        AppDelegate)?.saveContext()
                }
                
            }
        }
       /*
        todotableVC?.toDos.append(newTodo)
        todotableVC?.tableView.reloadData()*/
        navigationController?.popViewController(animated: true)
    }
    
}
