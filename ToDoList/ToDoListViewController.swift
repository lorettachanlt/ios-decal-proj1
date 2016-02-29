//
//  ToDoList.swift
//  ToDoList
//
//  Created by loretta chan on 2/25/16.
//  Copyright © 2016 loretta chan. All rights reserved.
//

import Foundation

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var model = [String]()
    var completed = [Bool]()
    var timeStamps = [NSDate]()
    var timer = NSTimer()
    var selectedIndexPath = NSIndexPath()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "checkForExpiredItems", userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToDoListTableViewController(segue: UIStoryboardSegue) {
    
    }
    
    @IBAction func unwindToDoListTableViewControllerAndAddNote(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindToDoListTableViewControllerAndDeleteNote(segue: UIStoryboardSegue) {
        model.removeAtIndex(selectedIndexPath.row)
        tableView.reloadData()
        
    }
    
    @IBAction func unwindToDoListTableViewControllerAndUpdateNote(segue: UIStoryboardSegue) {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: selectedIndexPath) as! ToDoListTableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        completed[selectedIndexPath.row] = true
        tableView.reloadData()
        tableView.setNeedsDisplay()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        cell.toDoItemTextLabel.text = model[indexPath.row]
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndexPath = indexPath
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "editNoteSegue") {
            let viewController = segue.destinationViewController as! EditToDoViewController
            let indexPath = tableView.indexPathForSelectedRow!
            viewController.displayToDoText(model[indexPath.row])
            
        }
        else if (segue.identifier == "displayDailyStatsSegue") {
            let viewController:DailyStatViewController = segue.destinationViewController as! DailyStatViewController
            var numOfCompletedTasks = 0
            for task in completed {
                if (task) {
                    numOfCompletedTasks += 1
                }
            }
            viewController.updateNumOfTasks(numOfCompletedTasks)
            
        }

        
    }
    
    func checkForExpiredItems() {
        for timestamp in timeStamps {
            let expiryDate = timestamp.dateByAddingTimeInterval(60*60*24)
            let currentIndex = timeStamps.indexOf(timestamp)!
            if (expiryDate.earlierDate(NSDate()) == expiryDate && completed[currentIndex]) {
                model.removeAtIndex(currentIndex)
                timeStamps.removeAtIndex(currentIndex)
                completed.removeAtIndex(currentIndex)
            }
        }
        tableView.reloadData()
    }
    
}

    