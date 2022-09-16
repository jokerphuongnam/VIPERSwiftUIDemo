//
//  AddImageInteractor.swift
//  ViperDemo
//
//  Created by P.Nam on 16/09/2022.
//

import Foundation

protocol AddImageUseCase {
    
}

final class AddImageInteractor: AddImageUseCase {
    private var userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
        #if DEBUG
        print("Init \(String(describing: Self.self))")
        #endif
    }
}
