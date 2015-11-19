//
//  PersonController.swift
//  Pair
//
//  Created by Edward Suczewski on 11/18/15.
//  Copyright © 2015 Edward Suczewski. All rights reserved.
//

import Foundation

class PersonController {
    
    private let kPeople = "people"
    
    static let sharedController = PersonController()
    
    var people: [Person]
    
    init() {
        self.people = []
        
        self.loadFromPersistentStorage()
    }
    
    // Create
    
    func addPerson(name: String) {
        people.append(Person(name: name))
        
        self.saveToPersistentStorage()
    }
    
    // Read
    
    
    // Update
    
    // Delete
    
    // Randomize
    
    func randomize() {
        people.sortInPlace {(_,_) in arc4random() < arc4random()}
    }
    
    // MARK: Persistence
    
    func saveToPersistentStorage() {
        
        let personDictionaries = self.people.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(personDictionaries, forKey: kPeople)
    }
    
    func loadFromPersistentStorage() {
        
        let personDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kPeople) as? [Dictionary<String, AnyObject>]
        
        if let personDictionaries = personDictionariesFromDefaults {
            
            self.people = personDictionaries.map({Person(dictionary: $0)!})
        }
    }
    
    
}