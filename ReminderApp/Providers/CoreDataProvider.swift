//
//  CoreDataProvider.swift
//  ReminderApp
//
//  Created by Alexandre Repaire-Carlier on 07/02/2023.
//

import Foundation
import CoreData

class CoreDataProvider {
    static let shared = CoreDataProvider()
    let persistentContainer: NSPersistentContainer

    private init() {
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        
        self.persistentContainer = NSPersistentContainer(name: "RemindersModel")
        self.persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Erreur lors de l'initialisation du RemindersModel \(error)")
            }
        }
    }
    
    
}
