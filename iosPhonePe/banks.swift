//
//  BankDto.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 14/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

import Foundation
import ObjectMapper



class banks: Mappable {
    
    
    var bankName: String?
    var bankId: Int?
    var ifscPrefix: String?
    var isPartner: Bool?
    var isPremier: Bool?
    var priority: Int?
    
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
