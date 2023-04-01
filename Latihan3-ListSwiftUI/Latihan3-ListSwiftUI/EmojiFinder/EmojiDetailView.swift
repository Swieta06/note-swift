//
//  EmojiDetailView.swift
//  Latihan3-ListSwiftUI
//
//  Created by MacBook Pro on 24/03/23.
//

import SwiftUI

struct EmojiDetailView: View {
    
    let emojiDertails: EmojiModel
    
    var body: some View {
        VStack{
            Text(emojiDertails.emoji)
                .font(.system(size: 120))
                .padding(.bottom)
            Text(emojiDertails.name)
                .font(.system(.largeTitle,
                              design:.rounded))
                .padding(.bottom)
            Text(emojiDertails.description)
                .font(.system(size:18,
                              design:.rounded))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
    }
}

struct EmojiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiDetailView(emojiDertails: EmojiModel(emoji:"👩🏻‍🚀",name:"astronout",description: "ini emoji astronout lucukk bangetttt"))
    }
}
