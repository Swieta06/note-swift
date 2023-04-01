//
//  PrimaryButton.swift
//  TriviaGames
//
//  Created by MacBook Pro on 30/03/23.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    //ini buat set background color button
    var background: Color = Color("AccentColor")
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 10)
        
        
    }
}
//primari button harus menggunakan parameter string
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
