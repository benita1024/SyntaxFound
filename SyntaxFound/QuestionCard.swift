//
//  QuestionCard.swift
//  SyntaxFound
//
//  Created by Benita Besa on 4/12/25.
//


import SwiftUI

struct QuestionCard: View {
    let question: Question
    @State private var userAnswer: String = ""
    @State private var showResult = false
    @State private var isCorrect = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(question.questionText)
                .font(.headline)

            if question.type == .multipleChoice, let options = question.options {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        checkAnswer(option)
                    }) {
                        Text(option)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
            } else {
                TextField("Your answer", text: $userAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top, 4)

                Button("Submit") {
                    checkAnswer(userAnswer)
                }
                .padding(.top, 8)
            }

            if showResult {
                Text(isCorrect ? "✅ Correct!" : "❌ Try again.")
                    .foregroundColor(isCorrect ? .green : .red)

                if let explanation = question.explanation {
                    Text("💡 Explanation: \(explanation)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                }
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.05))
        .cornerRadius(12)
        .shadow(radius: 2)
    }

    func checkAnswer(_ answer: String) {
        isCorrect = answer.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
            == question.correctAnswer.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        showResult = true
    }
}
