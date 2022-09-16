//
//  UserNetwork.swift
//  ViperDemo
//
//  Created by P.Nam on 15/09/2022.
//

import Foundation

protocol UserNetwork {
    func fetchUsers() -> [User]
    func addUser(name: String, gender: Gender)
    func update(uuid: UUID, name: String, gender: Gender)
    func delete(uuid: UUID)
}

final class UserNetworkImpl: UserNetwork {
    private var users: [User]
    
    init() {
        self.users = []
#if DEBUG
        print("Init \(String(describing: Self.self))")
#endif
    }
    
    func fetchUsers() -> [User] {
        return users
    }
    
    func addUser(name: String, gender: Gender) {
        users.append(.init(name: name, gender: gender))
    }
    
    func update(uuid: UUID, name: String, gender: Gender) {
        for index in 0..<users.count {
            if users[index].id == uuid {
                users[index].name = name
                users[index].gender = gender
                return
            }
        }
    }
    
    func delete(uuid: UUID) {
        users.removeAll { user in
            user.id == uuid
        }
    }
}
