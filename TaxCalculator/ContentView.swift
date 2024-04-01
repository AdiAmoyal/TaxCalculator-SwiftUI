//
//  ContentView.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                    .foregroundColor(.theme.accent)
                Text("Hello, world!")
                    .foregroundColor(.theme.secondaryText)
                Text("Hello, world!")
                    .foregroundColor(.theme.blue)
            }
            .font(.title)
        .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
