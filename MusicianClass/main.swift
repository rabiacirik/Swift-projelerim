//
//  main.swift
//  MusicianClass
//
//  Created by Rabia Cırık on 19.04.2025.
//

import Foundation

let james = Musicians(name: "jame", age: 40, ınsturment: "gitar",musicianstype: musicianstype.bass)
print(james.musicianstype)
print(james.age)
james.sing()

let kirk = SuperMusician(name: "kirk", age: 22, ınsturment:"piyano", musicianstype: musicianstype.drums)
kirk.sing()
