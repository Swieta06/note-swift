//
//  ArticleListView.swift
//  Ltihan7-Prototyping
//
//  Created by MacBook Pro on 29/03/23.
//

import SwiftUI

struct ArticleListView: View {
    // MARK: -PROPERTIES
    @State var articles = dummyArticles
    let now = Date()
    
    var body: some View {
        NavigationStack {
            List{
                //di foreach ada identifier ondelet
                ForEach(articles){ article in
                    HStack(alignment: .top, spacing: 16) {
                        AsyncImage(url: URL(string: article.imageURL)){
                            image in image
                                .resizable()
                                .scaledToFill()
                            
                        }placeholder: {
                            Color.gray.opacity(0.1)
                        }
                        .frame(width: 120, height: 120)
                        .cornerRadius(20)
                        VStack (alignment: .leading,spacing: 8){
                            Text(article.title)
                                .font(.system(.title3,design: .rounded))
                                .fontWeight(.bold)
                            Text("Author: Sena")
                                .font(.callout)
                                .foregroundColor(.brown)
                            Text(now,style: .date)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }//: VSTACK
                        
                    }//: Hstack
                }
                //ini identifier on delet foreach
                .onDelete { index in
                    articles.remove(atOffsets: index)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false){
                    Button{
                        
                    }label: {
                        Image(systemName: "pin")
                    }
                    .tint(.yellow)
                    Button{
                        
                    }label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .tint(.indigo)
                }
            }//:List
            //nghilangin garis
            .listStyle(.plain)
            .navigationTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
