//
//  TodoListCloneApp.swift
//  TodoListClone
//
//  Created by jihoon an on 9/8/24.
//

import SwiftUI

@main
struct TodoListCloneApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
