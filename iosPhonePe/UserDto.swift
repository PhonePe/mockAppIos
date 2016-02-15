//
//  UserDto.swift
//  iosPhonePe
//
//  Created by Prasad Pai on 14/02/16.
//  Copyright © 2016 Prasad Pai. All rights reserved.
//

import Foundation
import ObjectMapper

/*

{
"email": "jchawda@phonepe.com"
"name": "Jay Chawda"
"mobileNumber": 7259582746
"isValid": false
}

*/


class UserDto: Mappable {
    
    
    var email: String?
    var mobileNumber: Int?
    var name: String?
    var isValid: Bool?

    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        email           <- map["email"]
        name            <- map["name"]
        mobileNumber    <- map["isPartner"]
        isValid         <- map["isValid"]
      
    }
    
    
    
}


    