//
//  InjectionKey.swift
//  AppPostTestTask
//
//  Created by Vakhtang on 26.02.2024.
//

import Foundation

protocol InjectionKey {
    
    associatedtype Value
    
    static var currentValue: Self.Value { get set }
}
