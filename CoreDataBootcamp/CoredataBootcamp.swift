//
//  CoredataBootcamp.swift
//  CoreDataBootcamp
//
//  Created by jihoon an on 10/9/24.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    let container : NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "FruitContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
    }
}

struct CoredataBootcamp: View {
    
    @StateObject var vm = CoreDataViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CoredataBootcamp()
}
