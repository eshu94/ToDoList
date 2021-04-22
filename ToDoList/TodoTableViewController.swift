//
//  TodoTableViewController.swift
//  ToDoList
//
//  Created by ESHITA on 27/09/19.
//  Copyright © 2019 ESHITA. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var toDoCoreDatas = [ToDodata]()
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
        tableView.tableFooterView = UIView(frame: .zero)
    }
    func getToDos(){
        
        if let context = (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext{
            
            if let toDosFromCoreData = try? context.fetch(ToDodata.fetchRequest()
                ){
                if let toDos = toDosFromCoreData as? [ToDodata]{
                   // print(toDos)
                    toDoCoreDatas = toDos
                    tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return toDoCoreDatas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let currentToDo = toDoCoreDatas[indexPath.row]
        
        if currentToDo.importantData {
            if let name = currentToDo.nameData{
                cell.textLabel?.text = "❗️" + name.prefix(1).capitalized + name.dropFirst(1)
            }
        }else {
            if let name2 = currentToDo.nameData{
                cell.textLabel?.text = name2.prefix(1).capitalized + name2.dropFirst(1)
            }
        }
       
        //FOR WHITE COLOR TEXT
        cell.textLabel?.textColor = UIColor.init(displayP3Red: 1, green: 1, blue: 1, alpha: 1)
        
        //FOR BLACK COLOR :- cell.textLabel?.textColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        cell.textLabel?.font = UIFont(name: "TimesNewRomanPSMT", size: 22.0)
        cell.backgroundColor = UIColor.init(red: 0.1568, green: 0.1568, blue: 0.1175, alpha: 0.5)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue,
        sender: Any?) {
        
        if let createVC = segue.destination as? AddItemsViewController {
            
            createVC.todotableVC = self
        }
        
        if let completeVC = segue.destination as? CompleteToDoViewController {
            if let selectedTodo = sender as? ToDodata{
                completeVC.toDo = selectedTodo
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedTodo = toDoCoreDatas[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: selectedTodo)
    }
    

}
