//
//  CardProfileComponent.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 02/04/23.
//

import SwiftUI

struct CardProfileComponent: View {
    var image:String
    var title:String
    var description:String
    var body: some View {
        HStack(alignment: .center){
            Image(image)
                .frame(width: 32,height: 32)
                .padding()
            VStack(alignment:.leading,spacing: 5){
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .kerning(1.2)
                Text(description)
                    .font(.subheadline)
                   
            }
        Spacer()
            
        }
        .frame(width: 343, height: 82)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
    }
}

struct CardProfileComponent_Previews: PreviewProvider {
    static var previews: some View {
        CardProfileComponent(image: "name", title: "Name", description: "Swieta Nurjanah hetty")
    }
}
