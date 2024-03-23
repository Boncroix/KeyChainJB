//
//  KeyChain.swift
//
//
//  Created by Jose Bueno Cruz on 23/3/24.
//

import Foundation
import KeychainSwift

protocol SecureDataProtocol {
    func set(token: String, key: String)
    func getToken(key: String) -> String?
    func deleteToken(key: String)
}
//MARK: - SecureData
public struct SecureDataKeychain: SecureDataProtocol {
    
    private let keychain = KeychainSwift()
    
    init(){}

    //set
    public func set(token: String, key: String) {
        keychain.set(token, forKey: key)
    }
    //get
    public func getToken(key: String) -> String? {
        if let token = keychain.get(key) {
            return token
        } else {
            return ""
        }
        
    }
    //delete
    public func deleteToken(key: String) {
        keychain.delete(key)
    }
}
//MARK: - FakeSecureData
public struct SecureDataUserDefaults: SecureDataProtocol {
    
    private let userDefaults = UserDefaults.standard
    
    init(){}

    //set
    public func set(token: String, key: String) {
        userDefaults.setValue(token, forKey: key)
    }
    //get
    public func getToken(key: String) -> String? {
        if let token = userDefaults.value(forKey: key) as? String{
            return token
        } else {
            return ""
        }
    }
    //delete
    public func deleteToken(key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
