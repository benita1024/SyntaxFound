//
//  HomeView.swift
//  SyntaxFound
//
//  Created by Benita Besa on 4/11/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedDifficulty: String = "Easy"
    let difficulties = ["Easy", "Medium", "Hard"]

    let topicsByDifficulty: [String: [String]] = [
        "Easy": ["Two Sum", "Valid Parentheses", "Merge Sorted Arrays"],
        "Medium": ["Longest Substring", "3Sum", "Group Anagrams"],
        "Hard": ["Median of Two Sorted Arrays", "Trapping Rain Water"]
    ]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("👋 Welcome back, Benita!")
                    .font(.largeTitle).bold()

                Picker("Difficulty", selection: $selectedDifficulty) {
                    ForEach(difficulties, id: \.self) { difficulty in
                        Text(difficulty)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(topicsByDifficulty[selectedDifficulty] ?? [], id: \.self) { topic in
                            NavigationLink(destination: QuestionSetView(topic: topic)) {
                                Text(topic)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.blue.opacity(0.1))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("SyntaxFound")
        }
    }
}
