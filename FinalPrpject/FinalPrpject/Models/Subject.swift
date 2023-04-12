//
//  Subject.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 10/04/23.
//

import Foundation
struct SubjectModel: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let url: String
    let description: String
}
extension SubjectModel {
    static let all : [SubjectModel] =  [
        SubjectModel(
            image: "👾",
            name: "Html",
            url: "https://www.w3schools.com/html/",
            description: "HTML is the standard markup language for Web pages."
        ),
        SubjectModel(
            image: "👾",
            name: "Css",
            url: "https://www.w3schools.com/css/",
            description: "CSS is the language we use to style an HTML document, CSS describes how HTML elements should be displayed."
        ),
        SubjectModel(
            image: "👾",
            name: "Javascript",
            url: "https://www.w3schools.com/js/",
            description: "JavaScript is the world's most popular programming language.JavaScript is the programming language of the Web."
        )
    ]
}

