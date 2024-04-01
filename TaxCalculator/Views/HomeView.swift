//
//  HomeView.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 30) {
                    percentInput
                    priceInput
                    calculateButton
                }
                .padding(.top, 10)
                
                Spacer()
                progressView
                Spacer()
                resultSection
                Spacer()
                Spacer()
            }
            .padding()
        }
    }
}

extension HomeView {
    
    private var percentInput: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("% Precentage")
                .font(.headline)
                .foregroundColor(.theme.accent)
            
            TextField("Enter the precentage..", text: $vm.percent)
                .font(.body)
                .foregroundColor(.theme.secondaryText)
                .keyboardType(.decimalPad)
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
            
            TextField("Enter the price..", text: $vm.price)
                .font(.body)
                .foregroundColor(.theme.secondaryText)
                .keyboardType(.decimalPad)
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
        
        Button(action: vm.calculate) {
            Text("Calculate".uppercased())
                .font(.headline)
                .foregroundColor(.theme.accent)
        }
        .padding(10)
        .background(Color.theme.blue)
        .cornerRadius(6)
    }
    
    private var progressView: some View {
        VStack {
            if vm.isLoading {
                ProgressView()
            } else {
                Text("")
                    .frame(height: 19)
            }
        }
    }
    
    private var resultSection: some View {
        HStack {
            VStack(spacing: 10) {
                Text("Before Tax:")
                    .font(.headline)
                    .foregroundColor(.theme.accent)
                
                Text(vm.beforeTax.asNumberString())
                    .font(.title)
                    .bold()
                    .foregroundColor(.theme.background)
            }
            .frame(width: 120)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.theme.blue)
            )
            
            Spacer()
            
            VStack(spacing: 10) {
                Text("Tax:")
                    .font(.headline)
                    .foregroundColor(.theme.accent)
                
                Text(vm.tax.asNumberString())
                    .font(.title)
                    .bold()
                    .foregroundColor(.theme.background)
            }
            .frame(width: 120)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.theme.blue)
            )
        }
        .padding(.horizontal, 20)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(dev.homeVM)
    }
}
