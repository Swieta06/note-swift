//
//  ImageComponent.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 02/04/23.
//

import SwiftUI

struct ImageComponent: View {
    var ImageName:String
    var body: some View {
        Image(ImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal,16)
            .frame(height: 300)
    }
}

struct ImageComponent_Previews: PreviewProvider {
    static var previews: some View {
        ImageComponent(ImageName: "image1")
    }
}
