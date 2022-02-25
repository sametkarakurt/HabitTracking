//
//  ContentView.swift
//  HabitTracking
//
//  Created by Samet Karakurt on 25.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAddHabit = false
    @StateObject var habits = Habits()
    
    var body: some View {
        NavigationView{
            List(habits.activities){habit in
                NavigationLink{
                    DetailView(habitItem: habit, habits: habits)
                } label: {
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("\(habit.title)")
                                .font(.headline)
                 
                            Text("\(habit.description)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text("\(habit.completionCount)")
                    }
                    
                }
            }
            .navigationTitle("Habit Tracking")
            .toolbar {
                Button{
                    showingAddHabit = true
                }
                label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit){
                AddHabit(habits: habits)
            }
            
        }
       
    }
    
    func removeActivities(at offsets : IndexSet){
        habits.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
