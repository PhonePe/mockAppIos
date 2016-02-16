//
//  AccountData.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 16/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

class AccountData {
    
    
    var bankName: String?
    var accountNo: String?
    var bankId: Int?
    var isActive: Bool?
    var isLinked: Bool?
    var balance: Int?
    var accountId: Int?
    var isDefault : Bool?
    var bankLogo: String?
    
    init?(bankName:String, accountNo:String, bankId:Int, isActive:Bool, isLinked:Bool, balance:Int, accountId:Int, isDefault:Bool, banklogo:String)
    {
        
        self.bankName = bankName
        self.accountId = accountId
        self.bankId = bankId
        self.isActive = isActive
        self.isLinked = isLinked
        self.balance = balance
        self.accountId = accountId
        self.isDefault = isDefault
        self.bankLogo = banklogo
        self.accountNo = accountNo
    }
    
}