//
//  ArrowView.swift
//  DayCounter
//
//  Created by Никита Куприянов on 26.06.2023.
//

import SwiftUI

struct Arrow: InsettableShape {
    
    var insetAmount: Double = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.height - insetAmount))
        path.addLine(to: CGPoint(x: rect.midX, y: insetAmount))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.height * 0.33))
        path.move(to: CGPoint(x: rect.midX, y: insetAmount))
        path.addLine(to: CGPoint(x: rect.width - insetAmount, y: rect.height * 0.33))

        return path
    }
    // требует протокол
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
}

struct CustomArrowView: View {
    var body: some View {
        Arrow()
            .strokeBorder(.white, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        CustomArrowView()
    }
}
