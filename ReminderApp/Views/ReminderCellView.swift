//
//  ReminderCellView.swift
//  ReminderApp
//
//  Created by Alexandre Repaire-Carlier on 10/02/2023.
//

import SwiftUI

enum ReminderCellEvents {
    case onInfo
    case onCheckedChange(Reminder, Bool)
    case onSelect(Reminder)
}

struct ReminderCellView: View {
    
    let reminder: Reminder
    @State private var checked: Bool = false
    let delay = Delay()
    let isSelected: Bool
    
    let onEvent: (ReminderCellEvents) -> Void
    
    private func formatDate(_ date: Date) -> String{
        if date.isToday {
            return "Today"
        }
        if date.isTomorrow {
            return "Tomorrow"
        }
        return date.formatted(date: .numeric, time: .omitted)
    }
    
    var body: some View {
        HStack{
            Image(systemName: checked ? "circle.inset.filled" : "circle")
                .font(.title2)
                .opacity(0.4)
                .onTapGesture {
                    checked.toggle()
                    
                    delay.cancel()
                    
                    delay.performWork {
                        onEvent(.onCheckedChange(reminder, checked))
                    }
                }
            
            VStack(alignment: .leading){
                Text(reminder.title ?? "")
                if let notes = reminder.notes, !notes.isEmpty {
                    Text(notes)
                        .font(.caption)
                        .opacity(0.4)
                }
                
                HStack{
                    if let reminderDate = reminder.reminderData {
                        Text(formatDate(reminderDate))
                    }
                    
                    if let reminderTime = reminder.reminderTime {
                        Text(reminderTime.formatted(date: .omitted, time: .shortened))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption)
                .opacity(0.4)
            }
            Spacer()
            Image(systemName: "info.circle.fill")
                .opacity(isSelected ? 1.0 : 0.0)
                .onTapGesture {
                    onEvent(.onInfo)
                }
        }
        .onAppear{
            checked = reminder.isCompleted
        }
        .contentShape(Rectangle())
            .onTapGesture {
                onEvent(.onSelect(reminder))
            }
    }
}

struct ReminderCellView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderCellView(reminder: PreviewData.reminder, isSelected: false, onEvent: {_ in})
    }
}
