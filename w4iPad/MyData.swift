//
//  MyData.swift
//  w4iPad
//
//  Created by John on 2020-01-30.
//  Copyright © 2020 John. All rights reserved.
//

import UIKit

class MyData: NSObject {
    var name : String = ""
    var email: String = ""
    
    func initWithData(name n : String, email e: String) {
        name = n
        email = e
    }
}
