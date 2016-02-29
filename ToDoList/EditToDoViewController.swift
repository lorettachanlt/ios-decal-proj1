//
//  EditToDoViewController.swift
//  ToDoList
//
//  Created by loretta chan on 2/28/16.
//  Copyright © 2016 loretta chan. All rights reserved.
//

import Foundation

import UIKit

class EditToDoViewController: UIViewController {
    
    @IBOutlet var toDoLabel: UILabel!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var markAsDoneButton: UIButton!
    var toDoText: String!
    
    func displayToDoText(passedValue: String!) {
        toDoText = passedValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoLabel.text = toDoText
    }
}