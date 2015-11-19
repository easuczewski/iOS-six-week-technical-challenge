//
//  Person.swift
//  Pair
//
//  Created by Edward Suczewski on 11/18/15.
//  Copyright © 2015 Edward Suczewski. All rights reserved.
//

import Foundation

struct Person {
    
    private let kName = "name"

    // MARK: Properties
    var name: String
    
    //MARK: Initializer
    init(name: String) {
        self.name = name
    }

//    func dictionaryCopy() -> Dictionary<Int, String> {
//        
//        var dictionary : [Int: String] = [:]
//        let people = PersonController.sharedController.people
//        
//        for n in 0...(people.count - 1) {
//            dictionary[n] = people[n].name
//        }
//        
//        return dictionary
//    }
    
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let name = dictionary[kName] as? String else {
            self.name = ""
            return nil
        }
        
        self.name = name
        
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        
        let dictionary = [
            kName: self.name
        ]
        
        return dictionary
    }
    
}
