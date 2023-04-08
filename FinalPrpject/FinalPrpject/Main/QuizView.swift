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
            VStack(spacing:20){
                Text("Quiz Game")
                Text("Congratulations, you completed the game!")
                Text("your scored \(quizMnager.score) out of \(quizMnager.length)")
                Button{
                    Task.init{
                        await quizMnager.fectQuiz()
                    }
                }label: {
                    MainBottonComponent(text: "Play Again")
                }
            }
            .foregroundColor(Color("Secondary"))
            .padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity)
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
