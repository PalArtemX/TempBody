//
//  TempSelection.swift
//  temperatura
//
//  Created by Artem Palyutin on 17.07.2021.
//

import SwiftUI
import CoreData

struct TempSelection: View {
    
    // To return to the home page after clicking the button
    @Environment(\.presentationMode) var presentationMode
    @State private var showTogle = false
    
    @ObservedObject var vm: CoreDataViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                
                Text(showTogle ? "Write the temperature indicators" : "Temperature indicators")
                    .font(.headline)
                    .foregroundColor(.colorTheme.textColor)
            
                if showTogle {
                    TextFieldTempView(vm: vm)

                    Button(action: {
                        withAnimation {
                            // MARK:  String extension, comma changes to a dot (.doubleValue)
                            vm.addTempBody(temp: Double(vm.textFieldTemp.doubleValue) , date: Date())
                            
                        }
                        // To return to the home page after clicking the button
                        presentationMode.wrappedValue.dismiss()
                    }, label: { LabelButton() })
                } else {
                    PickerTempView(vm: vm)
                    Button(action: {
                        vm.addTempBody(temp: vm.selectionPicker, date: Date())
                        
                        // To return to the home page after clicking the button
                        presentationMode.wrappedValue.dismiss()
                    }, label: { LabelButton() })
                }

                
                
                Spacer()
                
                Toggle(isOn: $showTogle, label: {
                    Text("Enter manually using the keyboard")
                })
                // Informational message for correct measurement
                Text(showTogle ? "Write the temperature indicators in digital format using a dot." : "Select the desired temperature")
                    .font(.subheadline)
                    .foregroundColor(.colorTheme.textGrayColor)
            } // VStack
            .animation(.easeInOut)
            .navigationTitle(Text("Metric 🌡"))
            .padding()
        } // NavigationView
        
    }
}










struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TempSelection(vm: CoreDataViewModel())
        }
    }
}

// MARK: - SubView
struct TextFieldTempView: View {
    
    @ObservedObject var vm: CoreDataViewModel
    
    var body: some View {
        TextField("", text: $vm.textFieldTemp)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 100, alignment: .center)
            .padding(.horizontal)
            .font(.largeTitle)
            .foregroundColor(.colorTheme.textColor)
            .keyboardType(.decimalPad)
            .padding()
    }
}

struct LabelButton: View {
    var body: some View {
        HStack {
            Text("Add a metric")
            Image(systemName: "thermometer")
        }
        .padding()
        .foregroundColor(.white)
        .font(.headline)
        .background(Color.blue)
        .cornerRadius(15)
    }
}
