//
//  EmojiListView.swift
//  Latihan3-ListSwiftUI
//
//  Created by MacBook Pro on 24/03/23.
//

import SwiftUI

struct EmojiListView: View {
    
    private var emojiSearchResult:[EmojiModel]
    {
        let results=EmojiProvider.all()
        if searchText.isEmpty{
            return results
        }else{
//            return results.filter{
//                index in index.name.lowercased().contains(searchText.lowercased())
//            }
            return results.filter{
                $0.name.lowercased()
                    .contains(searchText.lowercased())
            }
        }
       // return EmojiProvider.all()
    }
    @State private var searchText:String=""
    
    private var suggestedResult: [EmojiModel]{
        if searchText.isEmpty{
            return[]
        }else{
            return emojiSearchResult
        }
    }
    
    var body: some View {
        NavigationStack{
            List(emojiSearchResult) { result in
                NavigationLink(destination:{
                    EmojiDetailView(emojiDertails: result)
                }){
                Text("\(result.emoji) \(result.name) ")
                    .font(.title2)
                    .padding(6)
            }
            
            }
            .listStyle(.plain)
            .navigationTitle("Emoji Data")
            .searchable(
                text: $searchText,
            placement:
                    .navigationBarDrawer(displayMode:
                        .always),
                        prompt: "What emoji's that you are look for?")
            {
                ForEach(suggestedResult) { result in
                    Text("Hey, Are you looking for \(result.name) ?")
                        .searchCompletion(result.name)
                }
            }
        }
    }
}

struct EmojiListView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiListView()
    }
}
