//
//  wrapperTest.swift
//  SwiftUI_tutorial#1
//
//  Created by jihoon an on 8/18/24.
//

import Foundation




@propertyWrapper

struct UserDefault<T> {

    let key: String
    let defaultValue: T

    var wrappedValue: T {
        get { UserDefaults.standard.object(forKey: self.key) as? T ?? self.defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: self.key) }
    }
}
