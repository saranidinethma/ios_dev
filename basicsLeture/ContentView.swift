//
//  ContentView.swift
//  basicsLeture
//
//  Created by sarani dinethma on 2026-09-30.
//

import SwiftUI

enum MuscleGroup: CaseIterable {
    case chest
    case legs
    case back
    case shoulders
    case arms
}

extension MuscleGroup {
    //computed property
    var displayName: String {
        switch self {
        case .chest:
            return "chest group"
        case .legs:
            return "legs group"
        case .back:
            return "back group"
        case .shoulders:
            return "shoulders group"
        case .arms:
            return "arms group"
        }
    }
    
}

struct Workout {
    //stored
    let name: String
    let muscleGroup: MuscleGroup
    let duration: Int
    
    lazy var iit: String = {
        //some complex logic
        return "iit"
    }()
}

func isLongWorkout(workout: Workout) -> Bool {
    workout.duration >= 50
}

struct ContentView: View {
    let workouts = [
        Workout(name: "Bench Press", muscleGroup: .chest, duration: 45),
        Workout(name: "Incline Bench Press", muscleGroup: .chest, duration: 45),
        Workout(name: "Squats", muscleGroup: .legs, duration: 60),
        Workout(name: "PullUps", muscleGroup: .back, duration: 30)
    ]
    
    
    var greeting1 :some View{
        //            ForEach(MuscleGroup.allCases, id: \.self) { group in
        //                Text("\(group.displayName)")
        //            }
                    
        //            Divider()
        
        Section {
            ForEach(workouts, id: \.name) { workout in
                VStack(alignment: .leading) {
                    Text (workout.name)
                    Text ("\(workout.muscleGroup)")
                    Text ("\(workout.duration)")
            }
        }
           
        }
        
    }
    
    
    
    var greeting2: some View {

        
                Section {
                    
                    //                    let filteredItems = workouts.filter(isLongWorkout)
                    
                    //                    let filteredItems = workouts.filter { workout in
                    //                        workout.duration >= 50
                    //                    }
                    
                    let filteredItems = workouts.filter {
                        $0.duration >= 50
                    }
                    
                    ForEach(filteredItems, id: \.name) { workout in
                        
                        VStack(alignment: .leading) {
                            Text (workout.name)
                            Text ("\(workout.muscleGroup)")
                            Text ("\(workout.duration)")
                        }
                    
                    
                
                  
                    
                   
                }
                
            }
        }
        
    var  body : some View{
        
        List{
            
            greeting1
            greeting2
            
        }
    }
    
    }

let intArray = [1,2,3,4,5]
let stingArr = ["a","b","c" ,"d"]

func retrunFirstValue<T>(externalParamName x:[T]) -> T{
    return x[0]
}

//retrunFirstValue(externalParamName: intArray)

//func kCVReturnFirstIntValue(array: [Int])-> Int{
//    return array [0]
//}
//    func kCVReturnFirstStrValue(array: [String])-> String{
//        return array [0]
//
//
//    }
#Preview {
    ContentView()
}



