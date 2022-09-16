//
//  UserRepository.swift
//  ViperDemo
//
//  Created by P.Nam on 15/09/2022.
//

import Foundation

protocol UserRepository {
    func getUsers() -> [User]
    func addUser(name: String, gender: Gender)
    func update(uuid: UUID, name: String, gender: Gender)
    func delete(uuid: UUID)
}

final class UserRepositoryImpl: UserRepository {
    private var network: UserNetwork
    
    init(network: UserNetwork) {
        self.network = network
#if DEBUG
        print("Init \(String(describing: Self.self))")
#endif
    }
    
    func getUsers() -> [User] {
        network.fetchUsers()
    }
    
    func addUser(name: String, gender: Gender) {
        network.addUser(name: name, gender: gender)
    }
    
    func update(uuid: UUID, name: String, gender: Gender) {
        network.update(uuid: uuid, name: name, gender: gender)
    }
    
    func delete(uuid: UUID) {
        network.delete(uuid: uuid)
    }
}
