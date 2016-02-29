//
//  DailyStatViewController.swift
//  ToDoList
//
//  Created by loretta chan on 2/29/16.
//  Copyright © 2016 loretta chan. All rights reserved.
//

import Foundation
import UIKit

class DailyStatViewController:  UIViewController {
    @IBOutlet var numOfTasksLabel: UILabel!
    var numOfTasks = 0
    
    func updateNumOfTasks(passedNum: Int!) {
        numOfTasks = passedNum
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog(String(numOfTasks))
        numOfTasksLabel.text = String(numOfTasks)
    }
    
}
