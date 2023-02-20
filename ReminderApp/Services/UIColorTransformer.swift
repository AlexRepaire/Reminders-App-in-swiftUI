//
//  UIColorTransformer.swift
//  ReminderApp
//
//  Created by Alexandre Repaire-Carlier on 09/02/2023.
//

import Foundation
import UIKit

class UIColorTransformer: ValueTransformer {
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else {return nil}
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else {return nil}
        
        do {
            let data = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
            return data
        } catch {
            return nil
        }
    }
}
