//
//  CustomOperator.swift
//  ReminderApp
//
//  Created by Alexandre Repaire-Carlier on 10/02/2023.
//

import Foundation
import SwiftUI

public func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
