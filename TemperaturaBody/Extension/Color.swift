//
//  Color.swift
//  temperatura
//
//  Created by Artem Palyutin on 17.07.2021.
//

import Foundation
import SwiftUI


struct ColorTheme {
    let textColor = Color("TextColor")
    let textGrayColor = Color("TextGrayColor")
    let tempColorFine = Color("TempColorFine")
    let tempColorLow = Color("TempColorLow")
    let tempColorRed = Color("TempColorRed")
}

extension Color {
    static let colorTheme = ColorTheme()
}



