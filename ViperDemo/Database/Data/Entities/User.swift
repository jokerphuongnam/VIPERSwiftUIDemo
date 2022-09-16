//
//  User.swift
//  ViperDemo
//
//  Created by P.Nam on 15/09/2022.
//

import Foundation

struct User {
    let id: UUID = UUID()
    var name: String
    var gender: Gender = .secret
}

extension User: Identifiable {
    
}

extension User {
    enum Gender: String {
        case male
        case female
        case other
        case secret
    }
}

typealias Gender = User.Gender

extension Gender: Hashable, CaseIterable {
    
}
