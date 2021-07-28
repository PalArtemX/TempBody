//
//  TextFieldView.swift
//  temperatura
//
//  Created by Artem Palyutin on 17.07.2021.
//

import SwiftUI
import CoreData

struct TextFieldView: View {
    
    // To return to the home page after clicking the button
    @Environment(\.presentationMode) var presentationMode
    
    
    @ObservedObject var vm: CoreDataViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                
                Text("Write the temperature indicators")
                    .font(.headline)
                    .foregroundColor(.colorTheme.textColor)
            
                
                TextField("", text: $vm.textFieldTemp)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100, alignment: .center)
                    .padding(.horizontal)
                    .font(.largeTitle)
                    .foregroundColor(.colorTheme.textColor)
                    .keyboardType(.numberPad)
                    .padding()

                Button(action: {
                    withAnimation {
                        vm.addTempBody(temp: Double(vm.textFieldTemp) ?? 0, date: Date())
                    }
                    
                    // To return to the home page after clicking the button
                    presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    HStack {
                        Text("Add a metric")
                        Image(systemName: "thermometer")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .font(.headline)
                    .background(Color.blue)
                    .cornerRadius(15)

                })
                
                
                Spacer()
                
                
                // Informational message for correct measurement
                Text("Write the temperature indicators in digital format using a dot.")
                    .font(.subheadline)
                    .foregroundColor(.colorTheme.textGrayColor)
            }
            
            .navigationTitle(Text("Metric 🌡"))
            .padding()
        }
    }
}







struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextFieldView(vm: CoreDataViewModel())
        }
    }
}
