//
//  ContentView.swift
//  TipCalc
//
//  Created by Athul Thomas on 25/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused:Bool
    let tipPercentages = [10,15,20,25,0]
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople+2)
        let tipSelection = Double(tipPercentage)
        let tipValue =  checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let totalAmtPerPerson = grandTotal/peopleCount
        return totalAmtPerPerson
        
    }

    var body: some View {
        
        NavigationStack {
            Form {
                
                Section{
                    TextField("Amount",value: $checkAmount,format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(UIKeyboardType.decimalPad)
                        .focused($amountIsFocused)

                        
                    Picker("Number of people:",selection:$numberOfPeople)
                    {
                        ForEach(2..<100)
                        {
                            Text("\($0) people")
                        }
                    }
                }header:{Text("Enter Amount:")}
                
                Section{
                    
                    Picker("Tip Percentage:",selection:$tipPercentage)
                    {
                        ForEach(tipPercentages,id: \.self)
                        {
                            Text($0,format:.percent)
                        }
                    }.pickerStyle(.segmented)
                    
                } header:{Text("How much Tip Amount?")}
                
                Section{
                    
                        Text(totalPerPerson,format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                }header:{Text("Amount Per Person:")}
                    
                    
            }
            .navigationTitle("Tip Calc")
            .toolbar {
                ToolbarItemGroup(placement:.keyboard){
                    Spacer()
                    Button("Done") {
                           amountIsFocused = false
                           print("Done tapped!")
                    }
                }
               
            }
        }
        .padding()
        
        }
        
        
        
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
