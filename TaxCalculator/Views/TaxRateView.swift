//
//  TaxRateView.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 02/04/2024.
//

import SwiftUI

struct TaxRateView: View {
    
    @ObservedObject var vm: TaxRateLookupViewModel
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
                    CustomButton(title: "copy", action: vm.copyTaxRateToClipboard)
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
    
    func toggleShowTaxRateView() {
        withAnimation(.spring()) {
            showTaxRateView.toggle()
        }
    }
    
    private var taxRateSection: some View {
        VStack(spacing: 20) {
            Text("8208 161st Ave NE, Redmond, WA 98052")
                .font(.headline)
                .foregroundColor(.theme.secondaryText)
            
            VStack(spacing: 10) {
                Text("Tax Rate:")
                HStack {
                    Text("10.2%")
                    
                    Button {
                        vm.copyTaxRateToClipboard()
                    } label: {
                        Image(systemName: "doc.on.doc")
                            .font(.body)
                            .fontWeight(.regular)
                    }
                }
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
}

struct TaxRateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaxRateView(vm: dev.taxRateLookupViewModel, showTaxRateView: .constant(false))
        }
    }
}
