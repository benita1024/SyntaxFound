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

    @State private var allProblems: [LeetProblem] = []

    var filteredProblems: [LeetProblem] {
        allProblems.filter { $0.difficulty == selectedDifficulty }
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("👋 Welcome back, Benita!")
                    .font(.largeTitle)
                    .bold()

                Picker("Difficulty", selection: $selectedDifficulty) {
                    ForEach(difficulties, id: \.self) { difficulty in
                        Text(difficulty)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(filteredProblems) { problem in
                            NavigationLink(destination: QuestionSetView(titleSlug: problem.titleSlug)) {
                                ProblemRow(problem: problem)
                            }
                        }
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("SyntaxFound")
            .onAppear(perform: loadProblems)
        }
    }

    func loadProblems() {
        guard let url = Bundle.main.url(forResource: "leetcode_problems", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([LeetProblem].self, from: data) else {
            print("❌ Failed to load leetcode_problems.json")
            return
        }
        self.allProblems = decoded
    }
}

struct ProblemRow: View {
    let problem: LeetProblem

    var body: some View {
        VStack(alignment: .leading) {
            Text(problem.title)
                .font(.headline)
            Text(problem.topicTags.replacingOccurrences(of: ",", with: " • "))
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}
