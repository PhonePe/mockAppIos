//
//  UserOnBoardingController.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 15/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

import UIKit


class UserOnBoardingController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var pinField: UITextField!
    let limitLength = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pinField.delegate = self
    }
    
    func textField(pinfield: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = pinField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(pinField: UITextField) -> Bool {
        // Hide the keyboard.
        pinField.resignFirstResponder()
        return true
    }
    
  
    
}