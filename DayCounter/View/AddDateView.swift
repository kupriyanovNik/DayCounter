//
//  AddDateView.swift
//  DayCounter
//
//  Created by Никита Куприянов on 26.06.2023.
//

import SwiftUI

struct AddDateView: View {
    @State var selectedDate: Date = .now
    @State var text: String = ""
    @EnvironmentObject var appViewModel: AppViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 26) {
            mainDatePicker
            mainTextField
            mainButton
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 30)
        .frame(maxWidth: .infinity, alignment: .top)
        .background(.black)
    }
    private var mainDatePicker: some View {
        DatePicker("", selection: $selectedDate, in: Date()..., displayedComponents: [.date])
            .datePickerStyle(.graphical)
            .padding()
            .background(Color(hex: "1C1C1E"))
            .cornerRadius(20)
    }
    private var mainTextField: some View {
        TextField("Date text", text: $text)
            .padding(30)
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold))
            .background(Color(hex: "1C1C1E"))
            .cornerRadius(20)
    }
    private var mainButton: some View {
        Button {
            appViewModel.saveNewDateText(text: text, date: selectedDate)
            self.dismiss()
        } label: {
            Text("set")
                .padding(.vertical, 18)
                .frame(maxWidth: .infinity)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .background(Color(hex: "00A907"))
                .cornerRadius(20)
        }
        .buttonStyle(.plain)
    }
}

struct AddDateView_Previews: PreviewProvider {
    static var previews: some View {
        AddDateView()
            .environmentObject(AppViewModel())
            .preferredColorScheme(.dark)
    }
}

