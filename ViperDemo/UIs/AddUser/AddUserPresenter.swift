//
//  AddUserPresenter.swift
//  ViperDemo
//
//  Created by P.Nam on 15/09/2022.
//

import SwiftUI
import Combine

protocol AddUserPresentation {
    func addUser(name: String, gender: Gender)
    func update(uuid: UUID, name: String, gender: Gender)
}

final class AddUserPresenter: AddUserPresentation {
    private var interactor: AddUserUseCase
    
    init(interactor: AddUserUseCase) {
        self.interactor = interactor
#if DEBUG
        print("Init \(String(describing: Self.self))")
#endif
    }
    
    func addUser(name: String, gender: Gender) {
        interactor.addUser(name: name, gender: gender)
    }
    
    func update(uuid: UUID, name: String, gender: Gender) {
        interactor.update(uuid: uuid, name: name, gender: gender)
    }
}

final class AddUserPresentationKey: EnvironmentKey {
    typealias Value = AddUserPresentation
    static var defaultValue: AddUserPresentation = ReviewAddUserPresentation()
}

extension EnvironmentValues {
    var addUserPresentation: AddUserPresentation {
        get { self[AddUserPresentationKey.self] }
        set { self[AddUserPresentationKey.self] = newValue }
    }
}

final class ReviewAddUserPresentation: AddUserPresentation {
    func addUser(name: String, gender: Gender) {
        
    }
    
    func update(uuid: UUID, name: String, gender: Gender) {
        
    }
    
    fileprivate static let review: AddUserPresentation = ReviewAddUserPresentation()
}

#if DEBUG
extension AddUserPresentation {
    static var review: AddUserPresentation {
        ReviewAddUserPresentation.review
    }
}
#endif
