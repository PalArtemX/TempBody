//
//  Array.swift
//  TemperaturaBody
//
//  Created by Artem Palyutin on 31.08.2021.
//

import Foundation


extension Array {
    func addingTempRange() -> [Double] {
        var newArray: [Double] = []
        var start = 34.0
        while start <= 42.1 {
            newArray.append(start)
            start += 0.1
        }
        
        return newArray
    }
    
    
}
