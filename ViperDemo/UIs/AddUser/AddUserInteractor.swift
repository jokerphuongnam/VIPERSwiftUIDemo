//
//  AddUserInteractor.swift
//  ViperDemo
//
//  Created by P.Nam on 15/09/2022.
//

import SwiftUI

protocol AddUserUseCase {
    func addUser(name: String, gender: Gender)
    func update(uuid: UUID, name: String, gender: Gender)
}

final class AddUserInteractor: AddUserUseCase {
    private var userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
        #if DEBUG
        print("Init \(String(describing: Self.self))")
        #endif
    }
    
    func addUser(name: String, gender: Gender) {
        userRepository.addUser(name: name, gender: gender)
    }
    
    func update(uuid: UUID, name: String, gender: Gender) {
        userRepository.update(uuid: uuid, name: name, gender: gender)
    }
}
