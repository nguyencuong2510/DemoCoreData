//
//  ViewController.swift
//  DemoCoreData
//
//  Created by Admin on 12/3/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textField.delegate = self
        if let person = person {
            textField.text = person.name
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        updatePerson()
    }
    
    func updatePerson() {
        if let person = person {
            person.name = textField.text ?? ""
            AppDelegate.shared.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }

}

