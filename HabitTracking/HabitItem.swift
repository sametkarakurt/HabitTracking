//
//  HabitItem.swift
//  HabitTracking
//
//  Created by Samet Karakurt on 25.02.2022.
//

import Foundation

struct HabitItem : Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var completionCount: Int
}
