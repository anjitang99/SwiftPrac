//
//  Dispatch.swift
//  SwiftConcurrencyBootcamp
//
//  Created by jihoon an on 9/29/24.
//

import Foundation
import Combine

class ClubHouseHandsUp: Publisher { 
    typealias Output = String
    typealias Failure =  Never
    
    func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, String == S.Input {
        DispatchQueue.global(qos: .utility).async{
            
        }
    }
}
