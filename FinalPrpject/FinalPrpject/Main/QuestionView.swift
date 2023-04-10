//
//  QuestionView.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 07/04/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizMnager : QuizManager
    var body: some View {
        VStack(spacing: 40){
            HStack{
                //Text("Quiz" )
                TitleComponen(text: "Quiz")
                    .foregroundColor(Color("Secondary"))
                Spacer()
                Text("\(quizMnager.index + 1) of \(quizMnager.length)")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Main"))
                   
            }
            ProgressBarComponent(progress: quizMnager.progress)
            VStack(alignment: .leading,spacing: 20){
                Text(quizMnager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                ForEach(quizMnager.answerChoice, id:\.id){ answer in
                    AnswerRow(answer: answer)
                        .environmentObject(quizMnager)
                    
                }
                
            }
            Button{
                quizMnager.goToNextQuestion()
            }label: {
                MainBottonComponent(text: "Next", backgroundColor: quizMnager.answerSelected ? Color("Secondary") : Color(.lightGray))
            }
            .disabled(!quizMnager.answerSelected)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        //.navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuizManager())
    }
}

