//
//  String.swift
//  TemperaturaBody
//
//  Created by Artem Palyutin on 29.07.2021.
//

import Foundation
import UIKit



// MARK: - String extension, comma changes to a dot
extension String {
    static let numberFormatter = NumberFormatter()
    var doubleValue: Double {
        String.numberFormatter.decimalSeparator = "."
        if let result =  String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
}


//extension NumberFormatter {
//    static let shared = NumberFormatter()
//}
//extension StringProtocol {
//    var doubleValue: Double? {
//        return NumberFormatter.shared.number(from: String(self))?.doubleValue
//    }
//}
