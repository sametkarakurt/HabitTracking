//
//  AddHabit.swift
//  HabitTracking
//
//  Created by Samet Karakurt on 25.02.2022.
//

import SwiftUI

struct AddHabit: View {
    
    @State private var title = ""
    @State private var description = ""
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
                            
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Name Of Habit")){
                    TextField("Name", text: $title)
                }
                
                Section(header: Text("Description Of Habit")){
                    TextField("Description", text: $description)
                }
                
    
            }
            .navigationTitle("Add New Activity")
            .toolbar {
                Button("Save") {
                    let habit = HabitItem(title: title, description: description, completionCount: 0)
                    habits.activities.append(habit)
                    dismiss()
                }
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}
