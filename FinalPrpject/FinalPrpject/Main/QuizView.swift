//
//  QuizView.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 08/04/23.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var quizMnager : QuizManager
    var body: some View {
        if quizMnager.reachedEbd{
            VStack(spacing:10){
                TitleComponen(text: "Result")
                    .foregroundColor(Color("Main"))
                ImageComponent(ImageName: "EndQuiz")
                //TitleComponen(text: "Congratulations")
                //SubtitleComponent(text: "Congratulations, you completed the game!")
                Text("Congratulations, you completed the game!")
                    .bold()
                    .fontWeight(.heavy)
                Text("your scored \(quizMnager.score) out of \(quizMnager.length)")
                    .bold()
                    .padding()
                Button{
                    Task.init{
                        await quizMnager.fectQuiz()
                    }
                }label: {
                    MainBottonComponent(text: "Play Again")
                }
                Spacer()
            }
            .foregroundColor(Color("Secondary"))
            .padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .navigationBarHidden(true)
        }else{
            QuestionView()
                .environmentObject(quizMnager)
        }
      
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(QuizManager())
    }
}
