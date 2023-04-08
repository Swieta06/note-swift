//
//  CategoryButtonComponent.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 04/04/23.
//

import SwiftUI

struct CategoryButtonComponent: View {
    var text:String
    var body: some View {
        Text(text)
            .font(.system(size: 10))
            .fontWeight(.semibold)
            .frame(width: 54, height: 24)
            .foregroundColor(.white)
            .background(Color("Secondary"))
            .cornerRadius(16)
           // .padding(.horizontal,16)
        
    }
}

struct CategoryButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButtonComponent(text: "Category")
    }
}
