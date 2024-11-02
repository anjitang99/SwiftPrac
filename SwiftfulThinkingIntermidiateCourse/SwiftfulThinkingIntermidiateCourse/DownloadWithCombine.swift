//
//  DownloadWithCombine.swift
//  SwiftfulThinkingIntermidiateCourse
//
//  Created by jihoon an on 10/15/24.
//

import SwiftUI
import Combine

struct PostModel : Identifiable, Codable {
    let userId : Int
    let id : Int
    let title : String
    let body : String
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string : "https://jsonplaceholder.typicode.com/posts") else { return }
        
        
        //1.create Publisher
        //2. subscribe publisher on background thread
        //3,receive on main thread
        //4.tryMap (check that the data is good)
        //5.decode (decode data into postModel)
        //6.sink (put the item into our app)
        //7.store (cancel subscription if needed)
        
        URLSession.shared.dataTaskPublisher(for : url)
            .subscribe(on: DispatchQueue.global(qos: .background))//어차피 백그라운드에서 돌아가니 필요없음 지워도됨
            .receive(on: DispatchQueue.main)
            .tryMap (handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    print("finished!")
                case .failure(let error):
                    print("there was an error. \(error)")
                }
            } receiveValue: { [weak self] (returnedPosts) in
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)
    }
    
    func handleOutput (output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
}

struct DownloadWithCombine: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List{
            ForEach(vm.posts) { post in
                VStack(alignment: .leading){
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    DownloadWithCombine()
}
