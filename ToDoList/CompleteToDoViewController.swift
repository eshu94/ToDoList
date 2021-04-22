//
//  CompleteToDoViewController.swift
//  ToDoList
//
//  Created by ESHITA on 27/09/19.
//  Copyright © 2019 ESHITA. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    
    
    @IBOutlet weak var itemNameLabel: UILabel!
    var toDo : ToDodata? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

/*        if let toDoLabel = todo {
            itemNameLabel.text = toDoLabel.nameData
    }*/
        if let currentToDo = toDo {
            if currentToDo.importantData {
                if let name = currentToDo.nameData {
                    itemNameLabel.text = "❗️" + name.prefix(1).capitalized + name.dropFirst(1)
                }
            }else{
                if let name2 = currentToDo.nameData{
                    itemNameLabel.text = name2.prefix(1).capitalized + name2.dropFirst(1)
                }
            }
        }
}
    
    @IBAction func completeTapped(_ sender: Any) {
        
        //Detele todo & POPBACK
        
        if let context = (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext{
            if let toDoDelete = toDo {
                context.delete(toDoDelete)
            }
            (UIApplication.shared.delegate as?
                AppDelegate)?.saveContext()
        }
        
        navigationController?.popViewController(animated: true)
    }
    
   
}
