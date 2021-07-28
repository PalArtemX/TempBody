//
//  CoreDataViewModel.swift
//  TemperaturaBody
//
//  Created by Artem Palyutin on 24.07.2021.
//

import Foundation
import CoreData


class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    
    @Published var savedEntities: [TemperaturaEntity] = []
    @Published var textFieldTemp = ""
    
    
    init() {
        container = NSPersistentContainer(name: "TemperaturaBody")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                print("💾 Error loading Core Data ⚠️, \(error.localizedDescription)")
            } else {
                print("💾 Successfuly loaded Core Data. ✅")
            }
        }
        fetchTempBody()
    }
    
    
    // MARK: - Functions
    
    func fetchTempBody() {
        let request = NSFetchRequest<TemperaturaEntity>(entityName: "TemperaturaEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("💾 Error fetching ⚠️ \(error.localizedDescription)")
        }
    }
    
    
    func addTempBody(temp: Double, date: Date) {
        let newTempBody = TemperaturaEntity(context: container.viewContext)
        newTempBody.date = date
        newTempBody.temperatura = temp
        saveData()
        textFieldTemp = ""
    }
    
    
    func deleteTempBody(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchTempBody()
        } catch let error {
            print("💾 Error saving data ⚠️ \(error)")
        }
    }
    
}
