//
//  AnswwerRow.swift
//  TriviaGames
//
//  Created by MacBook Pro on 30/03/23.
//

import SwiftUI

@available(iOS 15, *)
struct AnswwerRow: View {
    var answer: Answer
    @State private var isSelected = false
    var green=Color(UIColor(.green))
    var red=Color(UIColor(.red))
    var body: some View {
       
            HStack{
                Image(systemName: "circle.fill")
                    .font(.caption)
                Text(answer.text)
                    .font(.caption)
                Spacer()
                if isSelected{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .frame(maxWidth: 20,minHeight: 20)
                }else{
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(.red)
                    
                }
                    
                
            }
            .padding(20)
            .frame(maxWidth: .infinity,alignment: .leading)
            .background(.white)
            .foregroundColor(.accentColor)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5)
            .onTapGesture {
                isSelected=true
            }
        
    }
}
@available(iOS 15, *)
struct AnswwerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswwerRow(answer: Answer(text: "Single", isCorrect: false))
    }
}
