//
//  Expenses.swift
//  iExpense
//
//  Created by Ngô Nam on 15/01/2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet { //chỉ cần có sự thay đổi giá trị thì sẽ thực hiện code bên dưới luôn -> sau khi ấn button save thì chạy code bên dưới
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") { //đọc dữ liệu từ key "Items"
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) { //convert giá trị decode được ra aray items
                items = decodedItems
                return
            }
        }
        items = []
    }
}
