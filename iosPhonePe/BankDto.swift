//
//  BankDto.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 14/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

import Foundation
import ObjectMapper



class BankDto: Mappable {
    
    
    var bankName: String? = ""
    var bankId: Int? = 0
    var ifscPrefix: String? = ""
    var isPartner: Bool?  = false
    var isPremier: Bool? = false
    var priority: Int?=0
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        bankId     <- map["bankId"]
        bankName   <- map["bankName"]
        ifscPrefix <- map["ifscPrefix"]
        isPartner  <- map["isPartner"]
        isPremier  <- map["isPremier"]
        priority    <- map["priority"]
    }
    

    
}
