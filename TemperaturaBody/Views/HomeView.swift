//
//  ContentView.swift
//  TemperaturaBody
//
//  Created by Artem Palyutin on 23.07.2021.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @StateObject var vm = CoreDataViewModel()
    @State private var showTextField = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.savedEntities) { item in
                    RowTemperatureView(temp: item.temperatura, date: item.date ?? Date())
                }
                .onDelete(perform: vm.deleteTempBody)
            }
            .listStyle(SidebarListStyle())
            
            // Transition TextFieldView
            .sheet(isPresented: $showTextField, content: {
                TextFieldView(vm: vm)
            })
            
            
            .navigationTitle(Text("Body Temperature"))
            
            // Add a metric
            .navigationBarItems(trailing: Button(action: {
                showTextField.toggle()
            }, label: {
                HStack {
                    Text("Add a metric")
                    Image(systemName: "thermometer")
                        .foregroundColor(.red)
                }
                .foregroundColor(.blue)
                .font(.headline)
            }))
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
