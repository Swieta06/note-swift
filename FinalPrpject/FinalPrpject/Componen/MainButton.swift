//
//  MainButton.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 01/04/23.
//

import SwiftUI

struct MainButton: View {
    var text:String
    var backgroundColor:Color=Color("Main")
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .font(.system(size: 20))
            .padding(EdgeInsets(top: 3, leading: 120, bottom: 3, trailing: 120))
            .foregroundColor(.white)
            .padding()
            .background(backgroundColor)
            .cornerRadius(20)

            
        
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(text: "Button")
    }
}
