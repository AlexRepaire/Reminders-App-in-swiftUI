//
//  ReminderApp.swift
//  ReminderApp
//
//  Created by Alexandre Repaire-Carlier on 08/02/2023.
//

import SwiftUI
import UserNotifications

@main
struct ReminderApp: App {
    
    init(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .alert]){ granted, error in
            if granted {
                
            } else {
                
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
        }
    }
}
