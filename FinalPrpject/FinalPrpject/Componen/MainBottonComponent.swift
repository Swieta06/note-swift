//
//  MainButton.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 01/04/23.
//

import SwiftUI

struct MainBottonComponent: View {
    var text:String
    var backgroundColor:Color=Color("Main")
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .frame(width: 343, height: 53)
            //.padding()
            .foregroundColor(.white)
            .background(Color("Main"))
            .cornerRadius(16)
           // .padding(.horizontal,16)
        
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainBottonComponent(text: "Button")
    }
}
