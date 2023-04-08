//
//  QuizManager.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 08/04/23.
//

import Foundation
import SwiftUI

class QuizManager: ObservableObject{
    private(set) var quiz: [Quiz.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEbd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoice: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    init(){
        Task.init{
            await fectQuiz()
        }
    }
    
    func fectQuiz() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else {fatalError("Missing URL")}
        let urlRequest = URLRequest(url: url)
        do{
           let (data,response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fatching dATA")}
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodeData=try decoder.decode(Quiz.self, from: data)
            DispatchQueue.main.async {
                self.index=0
                self.score = 0
                self.progress = 0.00
                self.reachedEbd=false
                self.quiz=decodeData.results
                self.length=self.quiz.count
                self.setQuestion()
            }
            
        }catch{
            print("Error fetching quiz : \(error)")
        }
    }
    func goToNextQuestion(){
        if index + 1 < length {
            index += 1
            //setting new question disini
            setQuestion()
        }else{
            reachedEbd = true
        }
    }
    func setQuestion(){
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        if index < length{
            let currentQuizQusetion = quiz[index]
            question = currentQuizQusetion.formattedQuestion
            answerChoice = currentQuizQusetion.answer
        }
    }
    func selectedAnswer(answer: Answer){
        answerSelected = true
        if answer.isCorrect{
            score += 1
        }
    }
}
