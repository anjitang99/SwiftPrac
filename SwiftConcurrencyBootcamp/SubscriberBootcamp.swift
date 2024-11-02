//
//  SubscriberBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by jihoon an on 10/9/24.
//

import SwiftUI

class SubscriberViewModel : ObservableObject {
    @Published var count : Int = 0
    
    func setUpTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink(receiveCompletion: <#T##((Subscribers.Completion<Timer.TimerPublisher.Failure>) -> Void)##((Subscribers.Completion<Timer.TimerPublisher.Failure>) -> Void)##(Subscribers.Completion<Timer.TimerPublisher.Failure>) -> Void#>, receiveValue: <#T##((Timer.TimerPublisher.Output) -> Void)##((Timer.TimerPublisher.Output) -> Void)##(Timer.TimerPublisher.Output) -> Void#>)
    }
}

struct SubscriberBootcamp: View {
    
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
        }
    }
}

#Preview {
    SubscriberBootcamp()
}
