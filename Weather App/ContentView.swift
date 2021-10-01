//
//  ContentView.swift
//  Weather App
//
//  Created by user198043 on 9/30/21.
//

import SwiftUI

extension Color {
    static let bg = Color("background")
    static let fgPrimary = Color(red: 245, green: 245, blue: 245)
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.bg.ignoresSafeArea()
            VStack {
                Text("Weather App")
                    .font(.system(size: 36, weight: .bold, design: .default))
                    .foregroundColor(Color.fgPrimary)
                    .padding(.bottom, 4)
                
                Text("Local weather near you")
                    .font(.system(size: 20, weight: .light, design: .default))
                    .foregroundColor(Color.fgPrimary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
