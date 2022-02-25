//
//  DetailView.swift
//  HabitTracking
//
//  Created by Samet Karakurt on 25.02.2022.
//

import SwiftUI

struct DetailView: View {
    @State var habitItem : HabitItem
    @ObservedObject var habits: Habits
    @State private var completionCount = 0
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .center){
            Form{
                Section(header: Text("Description")){
                    Text("\(habitItem.description)")
                }
                
                Section(header: Text("Completion Count")){
                    Stepper("\(completionCount)", onIncrement: {
                        completionCount += 1
                    }, onDecrement: {
                        completionCount -= 1
                    })
                }
                
                HStack{
                    Spacer()
                    Button("Remove"){
                        remove()
                        dismiss()
                    }
                    .frame(width: 100, height: 50, alignment: .center)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    Spacer()
                }


         
                
            }


        }

        .toolbar {
            Button("Save"){
                save()
                dismiss()
            }
           
        }
        .onAppear{
            completionCount = self.habitItem.completionCount
        }
        .navigationTitle(("\(habitItem.title)"))
    }

    
    func save(){
        var newHabitItem = HabitItem(title: habitItem.title, description: habitItem.description, completionCount: completionCount)
        if let index = habits.activities.firstIndex(of: habitItem){
            habits.activities[index] = newHabitItem
        }
    }
    
    func remove(){
        if let index = habits.activities.firstIndex(of: habitItem){
            habits.activities.remove(at: index)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(habitItem: HabitItem(title: "", description: "", completionCount: 0), habits: Habits())
    }
}
