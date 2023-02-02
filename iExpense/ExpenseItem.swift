//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ngô Nam on 15/01/2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
