//
//  Quiz.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 08/04/23.
//

import Foundation
struct Quiz:Decodable{
    var results: [Result]
    
    struct Result: Decodable,Identifiable{
        var id:UUID{
            UUID()
        }
        var category:String
        var type: String
        var difficulty:String
        var question: String
        var correctAnswer: String
        var incorrectAnswers:[String]

        
        var formattedQuestion:AttributedString{
            do{
               return try AttributedString(markdown: question)
            }catch{
                print("Error setting formattedQuestion\(error)")
                return ""
            }
        }
        var answer:[Answer]{
            do{
               let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrect = try incorrectAnswers.map{ answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                    
                }
                let allAnswer = correct + incorrect
                return allAnswer.shuffled()
                
            }catch{
                print("error setting answer:\(error)")
                return[]
            }
        }
    }
}
