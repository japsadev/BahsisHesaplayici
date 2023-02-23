//
//  ContentView.swift
//  HesapBolucu
//
//  Created by Salih Yusuf Göktaş on 23.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numbeOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numbeOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Tutar", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Kişiler", selection: $numbeOfPeople) {
                        ForEach(2 ..< 100){
                            Text("\($0) kişi")
                        }
                    }
                }
                Section {
                    Picker("Yüzde", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(.segmented)
                }header: {
                    Text("Ne kadar bahşiş bırakmak istiyorsunuz ?")
                }
                
                Section {
                    Text("$\(totalPerPerson)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
