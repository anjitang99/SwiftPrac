//
//  DoCatchThrowBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by jihoon an on 9/22/24.
//

import SwiftUI

class DoCatchThrowBootcampDataManager {
    
    let isActive: Bool = true
    
    func getTitle() -> (title:String?, error: Error?) {
        if isActive {
            return ("New Text!", nil)
        } else {
            return (nil,URLError(.badURL))
        }
    }
    
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("New Text!")
        } else {
            return .failure(URLError(.appTransportSecurityRequiresSecureConnection))
        }
    }
    
    func getTitle3() throws -> String{
        if isActive {
            return "new text!"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}

class DoCatchThrowBootcampViewModel : ObservableObject{
    @Published var text : String = "Starting text."
    let manager = DoCatchThrowBootcampDataManager()
    
    func fetchTitle() {
        /*
        let returnedValue = manager.getTitle()
        
        if let newTitle = returnedValue.title{
            self.text = newTitle
        } else if let error = returnedValue.error{
            self.text = error.localizedDescription
        }
         */
        /*
        let result = manager.getTitle2()
        
        switch result {
        case .success(let newTitle):
            self.text = newTitle
        case.failure(let error):
            self.text = error.localizedDescription
        }
         */
        do {
            let newTitle = try manager.getTitle3()
            self.text = newTitle
        } catch let error {
            self.text = error.localizedDescription
        }
    }
}

struct DoCatchThrowBootcamp: View {
    
    @StateObject private var viewModel = DoCatchThrowBootcampViewModel()
    
    
    var body: some View {
        Text(viewModel.text)
            .frame(width: 300, height: 300)
            .background(Color.blue)
            .onTapGesture {
                viewModel.fetchTitle()
            }
    }
}

#Preview {
    DoCatchThrowBootcamp()
}
