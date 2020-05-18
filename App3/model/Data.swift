//
//  Data.swift
//  App3
//
//  Created by Vương Toàn Bắc on 5/15/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import Foundation

struct DataJ:Codable {
    var createdAt:String?
    var name:String?
    var email:String?
    var phone:String?
    
init(createdAt:String , name :String , email:String , phone:String) {
    self.createdAt = createdAt
    self.name = name
    self.email = email
    self.phone = phone
}

}
