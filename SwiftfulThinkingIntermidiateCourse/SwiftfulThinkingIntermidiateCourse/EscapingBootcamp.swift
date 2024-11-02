//
//  EscapingBootcamp.swift
//  SwiftfulThinkingIntermidiateCourse
//
//  Created by jihoon an on 10/14/24.
//

import SwiftUI

class EscapingViewModel : ObservableObject {
    
    @Published var text : String = "Hello"
    
    func getData() {
        downloadData3 { [weak self] returnedData in
            self?.text = returnedData
        }
    }
    
    func downloadData() -> String {
        
        return "New Data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
}

struct EscapingBootcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingBootcamp()
}
