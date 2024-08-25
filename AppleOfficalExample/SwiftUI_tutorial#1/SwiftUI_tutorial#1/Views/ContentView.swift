//
//  ContentView.swift
//  SwiftUI_tutorial#1
//
//  Created by jihoon an on 8/9/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
