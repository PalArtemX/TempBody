//
//  TemperaturaBodyApp.swift
//  TemperaturaBody
//
//  Created by Artem Palyutin on 23.07.2021.
//

import SwiftUI

@main
struct TemperaturaBodyApp: App {
    //let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
