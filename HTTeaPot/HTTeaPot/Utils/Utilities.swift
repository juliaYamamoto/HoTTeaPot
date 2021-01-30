//
//  Utilities.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2021-01-29.
//

import Foundation

struct Utilities {
    
    static func onlyContainsNumbers(_ string: String) -> Bool{
        
        let numbers: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(string).isSubset(of: numbers)
    }
}
