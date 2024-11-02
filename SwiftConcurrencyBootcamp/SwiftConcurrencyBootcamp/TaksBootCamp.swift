//
//  TaksBootCamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by jihoon an on 10/5/24.
//

import SwiftUI

class TaskBootViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil
    
    func fetchImage() async {
        do {
            guard let url = URL(string: "https://picsum.photos/1000") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            
            let image = UIImage(data: data)
            self.image = image
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchImage2() async {
        do {
            guard let url = URL(string: "https://picsum.photos/1000") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            
            let image2 = UIImage(data: data)
            self.image2 = image2
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

struct TaksBootCamp: View {
    
    @StateObject private var viewModel = TaskBootViewModel()
    
    var body: some View {
        VStack(spacing: 40){
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            if let image = viewModel.image2 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchImage()
                await viewModel.fetchImage2()
            }
        }
    }
}

#Preview {
    TaksBootCamp()
}
