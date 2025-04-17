//
//  QuestionSetView.swift
//  SyntaxFound
//
//  Created by Benita Besa on 4/12/25.
//


import SwiftUI

struct QuestionSetView: View {
    let titleSlug: String
    @State private var questions: [Question] = []

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(titleSlug) Practice")
                    .font(.title).bold()

                ForEach(questions) { question in
                    QuestionCard(question: question)
                }
            }
            .padding()
        }
        .onAppear {
            loadMockQuestions()
        }
    }

    func loadMockQuestions() {
        questions = [
            Question(type: .multipleChoice, questionText: "What's the time complexity of Two Sum with a hash map?", options: ["O(n)", "O(n^2)", "O(log n)", "O(1)"], correctAnswer: "O(n)", explanation: "You only traverse the array once."),
            Question(type: .fillInTheBlank, questionText: "The brute-force approach for Two Sum has a time complexity of ____.", options: nil, correctAnswer: "O(n^2)", explanation: "You check every pair."),
            Question(type: .multipleChoice, questionText: "Which data structure helps optimize Two Sum?", options: ["List", "Stack", "HashMap", "Queue"], correctAnswer: "HashMap", explanation: nil)
        ]
    }
}
