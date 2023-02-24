//
//  projekt_labApp.swift
//  projekt_lab
//
//  Created by MarcinMB on 13/05/2022.
//

import SwiftUI

@main
struct projekt_labApp: App {
    
    let persistentContainer = CoreDataManager.shered.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
