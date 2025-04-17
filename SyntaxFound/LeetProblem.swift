//
//  LeetProblem.swift
//  SyntaxFound
//
//  Created by Benita Besa on 4/17/25.
//


import Foundation

struct LeetProblem: Identifiable, Codable {
    // Use QID as a unique identifier for each problem
    var id: String { QID }

    let QID: String
    let title: String
    let titleSlug: String
    let difficulty: String
    let acceptanceRate: Double
    let paidOnly: Bool
    let topicTags: String
    let categorySlug: String
}
