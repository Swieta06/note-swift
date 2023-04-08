//
//  Answer.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 07/04/23.
//

import Foundation
struct Answer: Identifiable{
    var id=UUID()
    var text:AttributedString
    var isCorrect: Bool
}
