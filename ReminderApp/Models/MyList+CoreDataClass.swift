//
//  MyList+CoreDataClass.swift
//  ReminderApp
//
//  Created by Alexandre Repaire-Carlier on 07/02/2023.
//

import Foundation
import CoreData

@objc(MyList)
public class MyList: NSManagedObject {
    
    var remindersArray: [Reminder] {
        reminders?.allObjects.compactMap({($0 as! Reminder)}) ?? []
    }
}
