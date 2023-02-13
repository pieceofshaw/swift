//
//  Expense.swift
//  Swift100_37_iExpense_Project7
//
//  Created by Zaiyuan Xiao on 2023/2/12.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
