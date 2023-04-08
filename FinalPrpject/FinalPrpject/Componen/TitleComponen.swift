//
//  TitleComponen.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 02/04/23.
//

import SwiftUI

struct TitleComponen: View {
    var text:String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .kerning(1.2)
            .padding(.top)
            .padding(.bottom,5)
        
    }
}

struct TitleComponen_Previews: PreviewProvider {
    static var previews: some View {
        TitleComponen(text: "Title")
    }
}
