//
//  AccountDto.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 16/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

import ObjectMapper


class AccountDto: Mappable {
    
    
    var accountNo: String? = ""
    var accountId: Int? = 0
    var ifsc: String? = ""
    var isLinked: Bool?  = false
    var isPrimary: Bool? = false
    var isActive: Bool? = false
    var balance: Int?=0
    var bank: BankDto? = nil
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        accountNo   <- map["accountNo"]
        accountId   <- map["accountId"]
        ifsc        <- map["ifsc"]
        isLinked    <- map["isLinked"]
        isPrimary   <- map["isPrimary"]
        isActive    <- map["isActive"]
        balance     <- map["balance"]
        bank        <- map["bank"]
    }
    
    
    
}