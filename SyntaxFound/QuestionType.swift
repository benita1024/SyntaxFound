//
//  QuestionType.swift
//  SyntaxFound
//
//  Created by Benita Besa on 4/12/25.
//


import Foundation

enum QuestionType: String {
    case multipleChoice
    case fillInTheBlank
    case shortAnswer
}

struct Question: Identifiable {
    let id = UUID()
    let type: QuestionType
    let questionText: String
    let options: [String]? // for multiple choice
    let correctAnswer: String
    let explanation: String?
}
