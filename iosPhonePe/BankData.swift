//
//  BankData.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 14/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//


class BankData {
    
    
    var bankName: String?
    var bankId: Int?
    var ifscPrefix: String?
    var isPartner: Bool?
    var isPremier: Bool?
    var priority: Int?
    var isSelected : Bool?
    var bankLogo: String?
    

    
    init?(bankName:String, bankId:Int, ifscPrefix:String, isPartner:Bool, isPremier:Bool, priority:Int, banklogo:String)
    {
        self.bankName = bankName
        self.bankId = bankId
        self.ifscPrefix = ifscPrefix
        self.isPartner = isPartner
        self.isPremier = isPremier
        self.priority = priority
        self.bankLogo = banklogo
        
        self.isSelected = false
    }
    
    

}


   