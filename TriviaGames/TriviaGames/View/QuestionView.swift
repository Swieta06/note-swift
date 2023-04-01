//
//  QuestionView.swift
//  TriviaGames
//
//  Created by MacBook Pro on 30/03/23.
//

import SwiftUI


struct QuestionView: View {
    var body: some View {
        VStack(){
            HStack(){
                Text("Trivia Games")
                    .LilacTitle()
                Spacer()
                Text("1 out of 10")
                    .foregroundColor(.accentColor)
                    .fontWeight(.heavy)
                
            }
            
            ProgressBar(progressBarr:40)
            VStack(alignment:.center, spacing: 20){
                Text("Swift merupakan bahasa pemograman yangdigunakan untuk membuat aplikasi?")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                if #available(iOS 15, *) {
                    AnswwerRow(answer: Answer(text: "false", isCorrect: true))
                    AnswwerRow(answer: Answer(text: "true", isCorrect:false ))
                    
                } else {
                 
                    // Fallback on earlier versions
                }
                               
            }
        }
        
        
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
    }
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
