//
//  PickerTempView.swift
//  TemperaturaBody
//
//  Created by Artem Palyutin on 31.08.2021.
//

import SwiftUI

struct PickerTempView: View {
    
    @ObservedObject var vm: CoreDataViewModel
    let tempRange: [Double] = []
    
    
    var body: some View {
        Picker(selection: $vm.selectionPicker,
               label: Text("Picker")) {
            ForEach(tempRange.addingTempRange(), id: \.self) { temp in
                if temp > 37 {
                    Text("\(temp, specifier: "%.1f")°")
                        .foregroundColor(.colorTheme.tempColorRed)
                } else if temp < 35 {
                    Text("\(temp, specifier: "%.1f")°")
                        .foregroundColor(.colorTheme.tempColorLow)
                } else {
                    Text("\(temp, specifier: "%.1f")°")
                        .foregroundColor(.colorTheme.tempColorFine)
                }
                
            }
            .font(.headline)
            
        }
    }
}


struct PickerTempView_Previews: PreviewProvider {
    static var previews: some View {
        PickerTempView(vm: CoreDataViewModel())
    }
}
