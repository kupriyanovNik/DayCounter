//
//  MainViewModel.swift
//  DayCounter
//
//  Created by Никита Куприянов on 26.06.2023.
//

import SwiftUI

class AppViewModel: ObservableObject {
    
    private let userDefaults = UserDefaults.standard
    
    @Published var main1Text: String = ""
    @Published var main2Text: String = ""
    @Published var main3Text: String = ""
    @Published var endDate: String = Date.now.formatDate()
    
    init() {
        getText()
    }
    
    func saveNewDateText(text: String, date: Date) {
        userDefaults.set(text, forKey: "textInDayCounter")
        userDefaults.set(date, forKey: "endDateInDayCounter")
        
        setText(text: text, date: date)
    }
    private func getText() {
        if let savedText = userDefaults.string(forKey: "textInDayCounter"),
           let savedDate = userDefaults.object(forKey: "endDateInDayCounter") as? Date {
            setText(text: savedText, date: savedDate)
        }
    }
    private func setText(text: String, date: Date) {
        if let formattedText = formatText(text: text, date: date) {
            self.main1Text = formattedText[0]
            self.main2Text = formattedText[1]
            self.main3Text = formattedText[2]
            self.endDate = date.formatDate()
        }
    }
    private func formatText(text: String, date: Date) -> [String]? {
        guard
            let range = text.range(of: "{date}")
        else { return nil }
        
        let startPosition = text.distance(from: text.startIndex, to: range.lowerBound)
        let endPosition = text.distance(from: text.startIndex, to: range.upperBound)
        
        let begin = text[0..<startPosition]
        let endText = text[endPosition..<text.count]
        
        let diffDate = date.getDifference().getNumberText()
        
        
        return [begin, diffDate, endText]
    }
    
}
