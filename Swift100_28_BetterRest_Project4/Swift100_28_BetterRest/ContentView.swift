//
//  ContentView.swift
//  Swift100_28_BetterRest
//
//  Created by Zaiyuan Xiao on 2023/2/6.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeUp
    @State private var coffee = 1.0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    //REVIEW: static makes it to the property of the type, not of a instance.
    static var defaultWakeUp: Date {
        var component = DateComponents()
        component.hour = 8
        component.minute = 0
        
        return Calendar.current.date(from: component) ?? Date.now
    }
    
    
    var body: some View {
        NavigationStack {
           
                Form{
                    Section {
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.5)
                        
                        DatePicker("Time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    } header: {
                        Text("sleep")
                    }
                    
                    
                    Section {
                        
                        Stepper("\(coffee.formatted()) cup of coffee", value: $coffee, in: 1...20)
                    } header: {
                        Text("Coffee intake")
                    }
                }
                .navigationTitle("SleepCal")
                .toolbar {
                    Button ("Cal", action: CalculateBedtime)
                            }
                    .alert(alertTitle, isPresented: $showingAlert) {
                        Button("OK") { }
                    } message: {
                        Text(alertMessage)
                    }
            
            }
            
            
        }
    
    
    
    func CalculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffee))
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            // more code here
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
