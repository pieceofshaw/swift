//
//  addView.swift
//  Swift100_37_iExpense_Project7
//
//  Created by Zaiyuan Xiao on 2023/2/12.
//

import SwiftUI

struct addView: View {
    @State var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("amount", value: $amount, format: .currency(code:Locale.current.currency?.identifier ?? "USD" ))
            }
        }
    }
}

struct addView_Previews: PreviewProvider {
    static var previews: some View {
        addView(expenses: Expenses())
    }
}
