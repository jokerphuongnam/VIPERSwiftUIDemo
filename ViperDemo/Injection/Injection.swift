//
//  Injection.swift
//  ViperDemo
//
//  Created by P.Nam on 15/09/2022.
//

import SwiftUI

final class Injection {
    init() {
#if DEBUG
        print("Init \(String(describing: Self.self))")
#endif
    }
    
    private lazy var userNetwork: UserNetwork = {
        UserNetworkImpl()
    }()
    
    private lazy var userRepository: UserRepository = {
        UserRepositoryImpl(network: userNetwork)
    }()
    
    private lazy var usersInteractor: UsersUseCase = {
        UsersInteractor(userRepository: userRepository)
    }()
    
    lazy var usersPresentation: UsersPresentation = {
        UsersPresenter(interactor: usersInteractor)
    }()
    
    private lazy var addUserIneractor: AddUserUseCase = {
        AddUserInteractor(userRepository: userRepository)
    }()
    
    lazy var addUserPresentation: AddUserPresentation = {
        AddUserPresenter(interactor: addUserIneractor)
    }()
    
    private lazy var addImageInteractor: AddImageInteractor = {
        AddImageInteractor(userRepository: userRepository)
    }()
    
    lazy var addImagePresenter: AddImagePresentation = {
        AddImagePresenter(interactor: addImageInteractor)
    }()
}

extension View {
    var appDelegate: AppDelegate {
        AppDelegate.instance
    }
}
