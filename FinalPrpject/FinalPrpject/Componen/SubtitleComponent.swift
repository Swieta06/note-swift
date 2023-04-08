//
//  SubtitleComponen.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 02/04/23.
//

import SwiftUI

struct SubtitleComponent: View {
    var text:String
    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(.regular)
            .kerning(1.2)
            .padding([.leading,.trailing])
            .multilineTextAlignment(.center)
    }
}

struct SubtitleComponen_Previews: PreviewProvider {
    static var previews: some View {
        SubtitleComponent(text: "subtitle")
    }
}
