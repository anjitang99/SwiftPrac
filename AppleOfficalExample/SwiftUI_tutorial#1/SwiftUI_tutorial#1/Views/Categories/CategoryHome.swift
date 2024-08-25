//
//  CategoryHome.swift
//  SwiftUI_tutorial#1
//
//  Created by jihoon an on 8/18/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

//#Preview {
    //CategoryHome()
//}
