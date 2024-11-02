//
//  WeakSelfBootcamp.swift
//  SwiftfulThinkingIntermidiateCourse
//
//  Created by jihoon an on 10/13/24.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    
    @AppStorage("count") var count : Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView(content: {
            NavigationLink("Navigate", destination: WeakSelfSecondScreen())
                .navigationTitle("Screen1")
        })
        .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green.cornerRadius(10))
            , alignment: .topTrailing
        )
    }
}

struct WeakSelfSecondScreen: View {
    
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack{
            Text("Second View")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

class WeakSelfSecondScreenViewModel : ObservableObject {
    @Published var data : String? = nil
    
    init() {
        print("INITIALIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey : "count")
        getData()
    }
    
    deinit {
        print("DEINITIALIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey : "count")
    }
    
    func getData() {
        /*
        DispatchQueue.global().async {
            self.data = "NEW DATA!!!"
        } 
         */
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 500){ [weak self] in
            self?.data = "NEW DATA!!!!"
        }
        
    }
}

#Preview {
    WeakSelfBootcamp()
}
