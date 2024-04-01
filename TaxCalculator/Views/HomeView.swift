//
//  HomeView.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var precentage: String = ""
    @State private var price: String = ""
    
    var result: Double = 0.0
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 30) {
                    percentageInput
                    priceInput
                    
                    calculateButton
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Result")
                        .font(.headline)
                        .foregroundColor(.theme.accent)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(result)")
                        .font(.title)
                        .bold()
                        .foregroundColor(.theme.secondaryText)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

extension HomeView {
    
    private var percentageInput: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("% Precentage")
                .font(.headline)
                .foregroundColor(.theme.accent)
            
            TextField("Enter the precentage..", text: $precentage)
                .font(.body)
                .foregroundColor(.theme.secondaryText)
                .keyboardType(.numberPad)
                .disableAutocorrection(true)
//                            .focused($isEnabled)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.theme.blue ,lineWidth: 1.4)
                )
        }
    }
    
    private var priceInput: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("$ Price")
                .font(.headline)
                .foregroundColor(.theme.accent)
            
            TextField("Enter the price..", text: $price)
                .font(.body)
                .foregroundColor(.theme.secondaryText)
                .keyboardType(.numberPad)
                .disableAutocorrection(true)
//                            .focused($isEnabled)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.theme.blue ,lineWidth: 1.4)
                )
        }
    }
    
    private var calculateButton: some View {
        Button {
            
        } label: {
            Text("Calculate".uppercased())
                .font(.headline)
                .foregroundColor(.theme.accent)
        }
        .padding(10)
        .background(Color.theme.blue)
        .cornerRadius(6)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
