//
//  ContentView.swift
//  DayCounter
//
//  Created by Никита Куприянов on 26.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAddViewShow: Bool = false
    @ObservedObject var appViewModel = AppViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            informationBar
            Spacer()
            mainText
            Spacer()
            
        }
        .padding(.horizontal, 37)
        .padding(.vertical, 50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(hex: "2D2D2D"))
        .sheet(isPresented: $isAddViewShow) {
            AddDateView()
                .environmentObject(appViewModel)
                .preferredColorScheme(.dark)
                .presentationDetents([.height(600), .large])
        }
    }
    private var informationBar: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text(Date.now.formatDate())
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.init(hex: "727272"))
            
            HStack {
                Text("today")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold))
                
                Spacer()

                CustomArrowView()
                    .rotationEffect(.degrees(90))
                    .frame(width: 15, height: 50)
                
                Spacer()
                
                Button {
                    self.isAddViewShow.toggle()
                } label: {
                    Text(appViewModel.endDate)
                        .foregroundColor(Color(hex: "00A907"))
                        .font(.system(size: 40, weight: .bold))
                        .background {
                            Capsule()
                                .fill(Color(hex: "00A907").opacity(0.1))
                                .blur(radius: 15)
                        }
                }
            }
            
        }
    }
    private var mainText: some View {
        Text(appViewModel.main1Text)
            .foregroundColor(.white)
            .font(.system(size: 40, weight: .bold))
        +
        Text(appViewModel.main2Text)
            .foregroundColor(Color(hex: "00A907"))
            .underline()
            .font(.system(size: 40, weight: .bold))
        +
        Text(appViewModel.main3Text)
            .foregroundColor(.white)
            .font(.system(size: 40, weight: .bold))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



