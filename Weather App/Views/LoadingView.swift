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
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        
        HStack{
            VStack(spacing: -10) {
                Text("Fullerton, CA")
                    .font(.system(size: 35))
                Text("MM/DD/YY")
                    .padding()
                Text("70°F")
                    .font(.system(size: 60))
            }.frame(width: 350, height: 200, alignment: .leading)
            Text("🌤")
                //.font(.system(size: 100))
        }
    }
}


/* Some problems are:
    - As I adjust the font size of 🌤 in the HStack, it shifts the other text and the 🌤 emoji goes off screen if it's too big
    - Text() is just temporarily placeholders for the actual data
    - Think there is a much more efficient way to position everything in the HStack including the HStack itself instead of
        just constantly using Spacing()
    - Overrall, things are a little too fixed. Things are moving relative to each other which I don't is what we want. It's probably preferred to be more dynamic and flexible
 */
