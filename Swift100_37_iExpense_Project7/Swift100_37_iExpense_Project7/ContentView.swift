//
//  ContentView.swift
//  Swift100_37_iExpense_Project7
//
//  Created by Zaiyuan Xiao on 2023/2/12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State var showSheet = false
    
    
    var body: some View {
        
        
        NavigationStack {
            List {
                ForEach(expenses.items, id:\.name) {
                    item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .sheet(isPresented: $showSheet) {
                addView(expenses: expenses)
            }
            .navigationTitle("iExpenses")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                } label:{
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
