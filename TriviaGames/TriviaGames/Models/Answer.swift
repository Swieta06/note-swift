//
//  Models.swift
//  TriviaGames
//
//  Created by MacBook Pro on 30/03/23.
//

import Foundation
@available(iOS 15, *)
struct Answer:Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect:Bool
}
