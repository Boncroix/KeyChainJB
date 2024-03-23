//
//  KeyChain.swift
//
//
//  Created by Jose Bueno Cruz on 23/3/24.
//

import Foundation
import KeychainSwift

public struct KeyChainJB {
    
    public init(){}
    
    //función guardar clave
    @discardableResult
    public func saveKC(key: String, value: String) -> Bool {
        if let data = value.data(using: .utf8) {
            return KeychainSwift().set(data, forKey: key)
        } else {
            return false
        }
    }
    
    //función cargar clave
    public func loadKC(key: String) -> String? {
        if let data = KeychainSwift().get(key) {
            return data
        } else {
            return ""
        }
    }
    
    //función borrar clave
    @discardableResult
    public func deleteKC(key: String) -> Bool {
        KeychainSwift().delete(key)
    }
}
