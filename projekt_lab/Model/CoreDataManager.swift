//
//  CoreDataManager.swift
//  projekt_lab
//
//  Created by MarcinMB on 18/05/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shered: CoreDataManager = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Nie udało się poprawnie uruchomić Core Data \(error)")
            }
        }
    }
}
