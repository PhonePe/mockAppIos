//
//  createAccountDto.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 17/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

import ObjectMapper


class CreateAccountDto: Mappable {
    
    
    var accountNo: Int? = 0
    var accountName: String? = ""
    var ifsc: String? = ""
    var nickname: String? = ""

    
    
    init?(accountName:String, ifsc:String, accountNo:Int, nickname:String)
    {
        
        self.accountNo = accountNo
        self.accountName = accountName
        self.ifsc = ifsc
        self.nickname = nickname

    }
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        accountNo   <- map["accountNo"]
        accountName   <- map["accountName"]
        ifsc        <- map["ifsc"]
        nickname    <- map["nickname"]
    }

}