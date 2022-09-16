//
//  UsersInteractor.swift
//  ViperDemo
//
//  Created by P.Nam on 15/09/2022.
//

import Foundation

protocol UsersUseCase {
    func getUsers() -> [User]
    func delete(uuid: UUID)
}

final class UsersInteractor: UsersUseCase {
    private var userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
#if DEBUG
        print("Init \(String(describing: Self.self))")
#endif
    }
    
    func getUsers() -> [User] {
        userRepository.getUsers()
    }
    
    func delete(uuid: UUID) {
        userRepository.delete(uuid: uuid)
    }
}
