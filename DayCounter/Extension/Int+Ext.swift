//
//  Int+Ext.swift
//  DayCounter
//
//  Created by Никита Куприянов on 26.06.2023.
//

import Foundation

extension Int {
    func getNumberText() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        switch self {
        case 0:
            return "today"
        case 1:
            return "tomorow"
        default:
            return formatter.string(for: self) ?? "zero"
        }
        
        
    }
}
