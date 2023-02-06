//
//  ContentView.swift
//  Swift100_19_challenge
//
//  Created by Zaiyuan Xiao on 2023/2/3.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    @State private var output = 0.0
    
    
//    @State private var inputUnitIndex = 0
//    @State private var outputUnitIndex = 0
//
//
//
//
//    let mConvert = [1, 0.001, 3.280839, 1.93613, 0.0006213]
//    let kmConvert = [1000, 1, 3280.839, 1936.13, 0.6213]
//    let ftConvert = [0.3048, 0.0003048, 1, 0.3333333, 0.0001893939]
//    let ydConvert = [0.9144, 0.0009144, 3, 1,  0.0005681818]
//    let miConvert = [1609.344, 1.609344, 5280, 1760, 1]
//
//
//    var outcome: Double {
//        var outcomeTotal: Double = 0.0
//        switch inputUnitIndex {
//        case 0:
//            outcomeTotal = mConvert[inputUnitIndex] * input
//        case 1:
//            outcomeTotal = kmConvert[inputUnitIndex] * input
//        case 2:
//            outcomeTotal = ftConvert[inputUnitIndex] * input
//        case 3:
//            outcomeTotal = ydConvert[inputUnitIndex] * input
//        case 4:
//            outcomeTotal = miConvert[inputUnitIndex] * input
//        default:
//           break
//        }
//        return outcomeTotal
//    }
//
    
        @State private var inputUnitIndex = "M"
        @State private var outputUnitIndex = "M"

    
    let mConvert = ["M": 1, "KM": 0.001, "FT": 3.280839, "YDS": 1.93613, "MI": 0.0006213]
    let kmConvert = ["M": 1000, "KM": 1, "FT": 3280.839, "YDS": 1936.13, "MI": 0.6213]
    let ftConvert = ["M": 0.3048, "KM": 0.0003048, "FT": 1, "YDS": 0.3333333, "MI": 0.0001893939]
    let ydConvert = ["M": 0.9144, "KM": 0.0009144, "FT": 3, "YDS": 1, "MI": 0.0005681818]
    let miConvert = ["M": 1609.344, "KM": 1.609344, "FT": 5280, "YDS": 1760, "MI": 1]
    
    var outcome: Double {
        var outcomeTotal: Double = 0.0
        switch inputUnitIndex {
        case "M":
            outcomeTotal = (mConvert[outputUnitIndex] ?? 0) * input
        case "KM":
            outcomeTotal = (kmConvert[outputUnitIndex] ?? 0) * input
        case "FT":
            outcomeTotal = (ftConvert[outputUnitIndex] ?? 0) * input
        case "YDS":
            outcomeTotal = (ydConvert[outputUnitIndex] ?? 0) * input
        case "MI":
            outcomeTotal = (miConvert[outputUnitIndex] ?? 0) * input
        default:
           break
        }
        return outcomeTotal
    }
    
    let units = ["M", "KM", "FT", "YDS", "MI"]
    
    var body: some View {
        
        NavigationStack{
            Form {
                
                //input
                Section {
                    Picker("UNIT", selection: $inputUnitIndex) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(height: 30)
                    
                    TextField("input", value: $input, format:.number)
                        .keyboardType(.numberPad)
        
                    
                } header: {
                    Text("Input")
                }
                
                
                //output
                Section{
                
                    Picker("UNIT", selection: $outputUnitIndex) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(height: 30)
                    
                    Text(outcome, format:.number)
                } header: {
                    Text("output")
                }
                
                
            }.navigationTitle("length conversion")
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
