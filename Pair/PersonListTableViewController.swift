//
//  PersonListTableViewController.swift
//  Pair
//
//  Created by Edward Suczewski on 11/18/15.
//  Copyright © 2015 Edward Suczewski. All rights reserved.
//

import UIKit

class PersonListTableViewController: UITableViewController {
    

    // MARK
    @IBAction func randomizeButtonTapped(sender: UIBarButtonItem) {
        PersonController.sharedController.randomize()
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: Table View Data Source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let peopleCount = PersonController.sharedController.people.count
        if peopleCount % 2 == 0 {
            return (peopleCount/2)
        } else {
            return (peopleCount/2 + 1)
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pairCell", forIndexPath: indexPath)
        
        let peopleCount = PersonController.sharedController.people.count
        let people = PersonController.sharedController.people
        
        if peopleCount % 2 == 0 {
            let partnerIndex: Int = (peopleCount-1) - (indexPath.row)
            let person = people[indexPath.row]
            let partner = people[(partnerIndex)]
        
            cell.textLabel?.text = ("\(person.name) is working with \(partner.name)")
        } else {
            if indexPath.row < (peopleCount/2) {
                let partnerIndex: Int = (peopleCount-1) - (indexPath.row)
                let person = people[indexPath.row]
                let partner = people[(partnerIndex)]
                cell.textLabel?.text = ("\(person.name) is working with \(partner.name)")
            } else {
                let person = people[indexPath.row]
                cell.textLabel?.text = ("\(person.name) has no partner ☹️")
            }
            
        }
        
        return cell
        
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toShow" {
            
            if let detailViewController = segue.destinationViewController as? PersonDetailViewController {
                
                _ = detailViewController.view
                
                let indexPath = tableView.indexPathForSelectedRow
                
                
                if let selectedRow = indexPath?.row {
                        let peopleCount = PersonController.sharedController.people.count
                        let person1 = PersonController.sharedController.people[selectedRow]
                        let person2 = PersonController.sharedController.people[peopleCount-1-selectedRow]
                        let idx1 = selectedRow
                        let idx2 = peopleCount-1-selectedRow
                        detailViewController.updateWithPersons(person1, person2: person2, idx1: idx1, idx2: idx2)
                    }

                }
            }
        }
    }

    



