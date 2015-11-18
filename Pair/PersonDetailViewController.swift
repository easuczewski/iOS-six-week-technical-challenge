//
//  PersonDetailViewController.swift
//  Pair
//
//  Created by Edward Suczewski on 11/18/15.
//  Copyright © 2015 Edward Suczewski. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func saveButtonTapped(sender: UIButton) {
        if let text = nameTextField.text {
            PersonController.sharedController.addPerson(text)
        } else {
            return
        }
        nameTextField.text = ""
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
