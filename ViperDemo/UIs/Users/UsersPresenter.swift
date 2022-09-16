//
//  UsersPresenter.swift
//  ViperDemo
//
//  Created by P.Nam on 15/09/2022.
//

import SwiftUI
import Combine

protocol UsersPresentation {
    func getUsers(users: Binding<[User]>)
    func delete(uuid: UUID)
}

final class UsersPresenter: UsersPresentation {
    private var interactor: UsersUseCase
    
    init(interactor: UsersUseCase) {
        self.interactor = interactor
#if DEBUG
        print("Init \(String(describing: Self.self))")
#endif
    }
    
    func getUsers(users: Binding<[User]>) {
        users.wrappedValue = interactor.getUsers()
    }
    
    func delete(uuid: UUID) {
        interactor.delete(uuid: uuid)
    }
}

final class UsersPresentationKey: EnvironmentKey {
    typealias Value = UsersPresentation
    static var defaultValue: UsersPresentation = ReviewUsersPresentation()
}

extension EnvironmentValues {
    var usersPresentation: UsersPresentation {
        get { self[UsersPresentationKey.self] }
        set { self[UsersPresentationKey.self] = newValue }
    }
}

final class ReviewUsersPresentation: UsersPresentation {
    func getUsers(users: Binding<[User]>) {
        
    }
    
    func delete(uuid: UUID) {
        
    }
    
    fileprivate static let review: UsersPresentation = ReviewUsersPresentation()
}

#if DEBUG
extension UsersPresentation {
    static var review: UsersPresentation {
        ReviewUsersPresentation.review
    }
}
#endif
