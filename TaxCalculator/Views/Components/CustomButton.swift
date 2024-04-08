//
//  CustomButton.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 07/04/2024.
//

import SwiftUI

struct CustomButton: View {
    
    let title: String
    let action: () -> ()
    
    var body: some View {
        Button(action: action) {
            Text(title.uppercased())
                .font(.headline)
                .foregroundColor(.theme.blue)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
        )
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "copy", action: { })
    }
}
