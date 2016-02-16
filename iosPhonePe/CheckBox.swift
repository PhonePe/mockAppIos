//
//  CheckBox.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 16/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    // Images
    let checkedImage = UIImage(named: "ic_checkbox_checked")! as UIImage
    let uncheckedImage = UIImage(named: "ic_checkbox")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, forState: .Normal)
            } else {
                self.setImage(uncheckedImage, forState: .Normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            if isChecked == true {
                isChecked = false
            } else {
                isChecked = true
            }
        }
    }
}
