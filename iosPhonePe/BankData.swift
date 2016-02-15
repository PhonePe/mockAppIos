//
//  BankData.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 14/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

import Foundation


class BankData {
    
    
    var bankName: String?
    var bankId: Int?
    var ifscPrefix: String?
    var isPartner: Bool?
    var isPremier: Bool?
    var priority: Int?
    

    
    init?(bankName:String, bankId:Int, ifscPrefix:String, isPartner:Bool, isPremier:Bool, priority:Int)
    {
        self.bankName = bankName
        self.bankId = bankId
        self.ifscPrefix = ifscPrefix
        self.isPartner = isPartner
        self.isPremier = isPremier
        self.priority = priority
    }
    
    

}


   