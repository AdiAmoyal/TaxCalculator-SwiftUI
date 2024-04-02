//
//  CustomTextField.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import SwiftUI

struct CustomTextField: View {
    
    let title: String
    @Binding var text: String
    
    var body: some View {
        TextField(title, text: $text)
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

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(title: "Enter.." ,text: .constant(""))
            .padding()
    }
}
