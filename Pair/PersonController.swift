//
//  PersonController.swift
//  Pair
//
//  Created by Edward Suczewski on 11/18/15.
//  Copyright © 2015 Edward Suczewski. All rights reserved.
//

import Foundation

class PersonController {
    
    static let sharedController = PersonController()
    
    var people: [Person]
    
    init() {
        self.people = []
    }
    
    // Create
    
    func addPerson(name: String) {
        people.append(Person(name: name))
    }
    
    // Read
    
    
    // Update
    
    // Delete
    
    // Randomize
    
    func randomize() {
        
        people.sortInPlace {(_,_) in arc4random() < arc4random()}
        
    }
    
}