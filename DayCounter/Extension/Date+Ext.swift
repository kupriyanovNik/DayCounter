//
//  Date+Ext.swift
//  DayCounter
//
//  Created by Никита Куприянов on 26.06.2023.
//

import Foundation

extension Date {
    func getDifference() -> Int {
        let calendar = Calendar.current
        let fromDate = calendar.startOfDay(for: Date.now)
        let toDate = calendar.startOfDay(for: self)
        let differenceComponents = calendar.dateComponents([.day], from: fromDate, to: toDate)
        return differenceComponents.day ?? 0
    }
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
        return formatter.string(from: self)
    }
}
