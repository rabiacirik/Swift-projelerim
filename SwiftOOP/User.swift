//
//  User.swift
//  SwiftOOP
//
//  Created by Rabia Cırık on 28.07.2024.
//

import Foundation

class User {
    var name = ""
    var age = 0
    var job = ""
    
    //initalizer
    
    init(name: String = "", age: Int = 0, job: String = "") {
        self.name = name
        self.age = age
        self.job = job
    }
    
    func exampleFunc() {
        print("çağırıldı")
    }
}
