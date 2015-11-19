//
//  PersonDetailViewController.swift
//  Pair
//
//  Created by Edward Suczewski on 11/18/15.
//  Copyright © 2015 Edward Suczewski. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    var person1: Person?
    var person2: Person?
    var idx1: Int?
    var idx2: Int?
    
    @IBOutlet weak var isWorkingWithLabel: UILabel!
    
    @IBOutlet weak var partnerTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var updateButton: UIButton!
    
    @IBAction func saveButtonTapped(sender: UIButton) {
            if let text = nameTextField.text {
                PersonController.sharedController.addPerson(text)
            } else {
                return
            }
            nameTextField.text = ""
            PersonController.sharedController.randomize()
    }

    
    @IBAction func updateButtonTapped(sender: UIButton) {
        if let text = nameTextField.text {
            if let idx = idx1 {
                PersonController.sharedController.updatePerson(text, idx: idx)
            }
        }
        if let text = partnerTextField.text {
            if let idx = idx2 {
                PersonController.sharedController.updatePerson(text, idx: idx)
            }
        }
        
    }
    
    func updateWithPersons(person1: Person, person2: Person, idx1: Int, idx2: Int) {
        self.person1 = person1
        self.person2 = person2
        self.idx1 = idx1
        self.idx2 = idx2
        partnerTextField.hidden = false
        isWorkingWithLabel.hidden = false
        updateButton.hidden = false
        saveButton.hidden = true
        self.nameTextField.text = person1.name
        self.partnerTextField.text = person2.name
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        partnerTextField.hidden = true
        isWorkingWithLabel.hidden = true
        updateButton.hidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
