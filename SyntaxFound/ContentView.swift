//
//  ContentView.swift
//  SyntaxFound
//
//  Created by Benita Besa on 4/10/25.
//

import SwiftUI
import Firebase

struct ContentView: View {
    // MARK: - Quiz Data
    let question = "Which data structure allows for O(1) lookups?"
    let options = ["Array", "HashMap", "Linked List", "Queue"]
    let correctAnswer = "HashMap"

    // MARK: - State
    @State private var selectedAnswer: String? = nil
    @State private var isAnswered: Bool = false
    
    init() {
            FirebaseApp.configure()  // <— This line initializes Firebase
        }

    var body: some View {
        VStack(spacing: 30) {
            Text("🧠 Data Structures Quiz")
                .font(.largeTitle)
                .bold()

            Text(question)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            ForEach(options, id: \.self) { option in
                Button(action: {
                    selectedAnswer = option
                    isAnswered = true
                }) {
                    Text(option)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(buttonColor(for: option))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .shadow(radius: 1)
                }
                .disabled(isAnswered)
            }

            if isAnswered {
                Text(selectedAnswer == correctAnswer ? "✅ Correct!" : "❌ Try Again")
                    .font(.headline)
                    .padding()
            }

            Spacer()
        }
        .padding()
    }

    // MARK: - Button Color Logic
    func buttonColor(for option: String) -> Color {
        guard isAnswered else { return Color.blue.opacity(0.2) }

        if option == selectedAnswer {
            return option == correctAnswer ? .green.opacity(0.7) : .red.opacity(0.5)
        } else {
            return Color.gray.opacity(0.1)
        }
    }
}

