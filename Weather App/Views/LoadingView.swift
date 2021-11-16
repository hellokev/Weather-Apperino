//
//  Loading.swift
//  Weather App
//
//  Created by Masa, Kyle on 11/11/21.
//

import SwiftUI

struct LoadingView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 36, weight: .bold, design: .default))
            .foregroundColor(Color.fgPrimary)
    }
}
