//
//  TextfieldComponent.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 02/04/23.
//

import SwiftUI

struct TextfieldComponent: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .autocapitalization(.none)
            .frame(width: 343, height: 53)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
    
            //.frame(minWidth: 0,maxWidth: .infinity)
           
    }
}

struct TextfieldComponent_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldComponent(text: .constant(""), placeholder: "Enter text here")
    }
}
