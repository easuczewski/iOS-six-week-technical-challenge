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
