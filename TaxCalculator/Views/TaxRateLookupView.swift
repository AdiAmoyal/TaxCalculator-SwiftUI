//
//  TaxRateLookupView.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import SwiftUI

struct TaxRateLookupView: View {
    
    @StateObject var vm = TaxRateLookupViewModel()
    @State var showTaxRateView: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
//                .sheet(isPresented: $showTaxRateView, content: { TaxRateView(showTaxRateView: $showTaxRateView) })
            
            VStack(spacing: 20) {
                header
                
                Divider()
                
                streetAddressInput
                cityInput
                zipInput
                
                searchButton
                
                Spacer()
            }
            .padding()
            
            TaxRateView(showTaxRateView: $showTaxRateView)
                .cornerRadius(30)
                .offset(y: showTaxRateView ? UIScreen.main.bounds.height * 0.4 : UIScreen.main.bounds.height)
                
        }
    }
}

extension TaxRateLookupView {
    
    private var header: some View {
        Text("Tax Rate Lookup")
            .font(.title2)
            .bold()
            .foregroundColor(Color.theme.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var streetAddressInput: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Street address:")
                .font(.headline)
                .foregroundColor(.theme.accent)
            
            CustomTextField(title: "Street address", text: $vm.streetAddress)
        }
    }
    
    private var cityInput: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("City:")
                .font(.headline)
                .foregroundColor(.theme.accent)
            
            CustomTextField(title: "City", text: $vm.city)
        }
    }
    
    private var zipInput: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("ZIP:")
                .font(.headline)
                .foregroundColor(.theme.accent)
            
            CustomTextField(title: "ZIP", text: $vm.zip)
        }
    }
    
    private var searchButton: some View {
        Button(action: searchButtonPressed) {
            HStack {
                Text("search".uppercased())
                    .font(.headline)
                    .foregroundColor(.theme.accent)
                Image(systemName: "arrow.forward")
            }
        }
        .padding(10)
        .background(Color.theme.blue)
        .cornerRadius(6)
    }
    
    private func searchButtonPressed() {
        vm.getTaxRate()
        withAnimation(.spring()) {
            showTaxRateView.toggle()
        }
    }
    
}

struct TaxRateLookupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaxRateLookupView()
        }
    }
}
