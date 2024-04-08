//
//  TaxRateView.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 02/04/2024.
//

import SwiftUI

struct TaxRateView: View {
    
    @Binding var showTaxRateView: Bool
    
    var body: some View {
        ZStack {
            
            Color.theme.secondaryText
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                xMarkButton
                taxRateSection
                
                VStack(spacing: 8) {
                    CustomButton(title: "calculate", action: {})
                    CustomButton(title: "copy", action: {})
                    CustomButton(title: "back", action: toggleShowTaxRateView)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

extension TaxRateView {
    
    private var xMarkButton: some View {
        Button {
            toggleShowTaxRateView()
        } label: {
            Image(systemName: "xmark")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var taxRateSection: some View {
        VStack(spacing: 20) {
            Text("8208 161st Ave NE, Redmond, WA 98052")
                .font(.headline)
                .foregroundColor(.theme.secondaryText)
            
            VStack(spacing: 10) {
                Text("Tax Rate:")
                Text("10.2%")
            }
            .font(.title2)
            .bold()
            .foregroundColor(.theme.blue)
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
        )
    }
    
    func toggleShowTaxRateView() {
        withAnimation(.spring()) {
            showTaxRateView.toggle()
        }
    }
}

struct TaxRateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaxRateView(showTaxRateView: .constant(false))
        }
    }
}
