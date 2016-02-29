//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by loretta chan on 2/26/16.
//  Copyright © 2016 loretta chan. All rights reserved.
//

import Foundation

import UIKit

class AddToDoViewController: UIViewController {
    
    @IBOutlet var noteDetailsTextView: UITextView!
    @IBOutlet var addButton: UIBarButtonItem!
    @IBOutlet var cancelButton: UIBarButtonItem!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "addNoteSegue") {
            let viewController:ToDoListTableViewController = segue.destinationViewController as! ToDoListTableViewController
            viewController.model.append(noteDetailsTextView.text)
            viewController.timeStamps.append(NSDate())
            viewController.completed.append(false)
            viewController.tableView.reloadData()
            print("added note")
        }
    }
    
}