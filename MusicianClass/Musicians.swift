//
//  Musicians.swift
//  MusicianClass
//
//  Created by Rabia Cırık on 19.04.2025.
//

import Foundation

enum musicianstype{
    case leadguitar
    case bass
    case drums
    
}

class Musicians{
    var name : String
    var age : Int
    var ınsturment : String
    var musicianstype : musicianstype
    
    init(name: String, age: Int, ınsturment: String, musicianstype: musicianstype) {
        self.name = name
        self.age = age
        self.ınsturment = ınsturment
        self.musicianstype = musicianstype
    }
    
    func sing(){
        print("söylüyor")
    }
}
