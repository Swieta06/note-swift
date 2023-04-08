//
//  CardCrouseComponent.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 04/04/23.
//

import SwiftUI

struct CardCrouseComponent: View {
    var image:String
    var Title:String
    var subtitle:String
    var body: some View {
        VStack(alignment:.leading){
            Image(image)
            TitleComponen(text: Title)
            Text(subtitle)
                .kerning(1.2)
                .font(.subheadline)
            
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 1))
    }
}

struct CardCrouseComponent_Previews: PreviewProvider {
    static var previews: some View {
        CardCrouseComponent(image: "Course_Image", Title: "UI", subtitle: "Advanced mobile interface design")
    }
}
