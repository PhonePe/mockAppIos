//
//  Account.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 14/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

import UIKit

class Account {
    
    
    //MARK: Properties
     var bankname: String
    
    
    init?(bankname:String)
    {
        self.bankname = bankname;
        
        if(bankname.isEmpty)
        {
            return nil
        }
    }
}
