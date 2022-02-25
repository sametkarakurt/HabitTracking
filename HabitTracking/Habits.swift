//
//  Habits.swift
//  HabitTracking
//
//  Created by Samet Karakurt on 25.02.2022.
//

import Foundation

class Habits: ObservableObject {
    @Published var activities = [HabitItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(activities){
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init(){
           if let saved = UserDefaults.standard.data(forKey: "Habits"){
               if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: saved){
                   activities = decodedItems
                   return
               }
           }
           activities = []
       }
}
