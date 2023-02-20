//
//  ReminderEditConfig.swift
//  ReminderApp
//
//  Created by Alexandre Repaire-Carlier on 10/02/2023.
//

import Foundation

struct ReminderEditConfig {
    var title: String = ""
    var notes: String?
    var isCompleted: Bool = false
    var hasDate: Bool = false
    var hasTime: Bool = false
    var reminderDate: Date?
    var reminderTime: Date?
    
    init() {
        
    }
    
    init(reminder: Reminder) {
        title = reminder.title ?? ""
        notes = reminder.notes
        isCompleted = reminder.isCompleted
        reminderDate = reminder.reminderData
        reminderTime = reminder.reminderTime
        hasDate = reminder.reminderData != nil
        hasTime = reminder.reminderTime != nil
    }
}
