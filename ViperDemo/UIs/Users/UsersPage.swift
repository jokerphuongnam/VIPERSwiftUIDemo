//
//  UsersPage.swift
//  ViperDemo
//
//  Created by P.Nam on 15/09/2022.
//

import SwiftUI

struct UsersPage: View {
    @State private var users: [User] = []
    @Environment(\.usersPresentation) private var presenter
    
    var body: some View {
        List {
            ForEach(users, id: \.id) { user in
                NavigationLink {
                    AddUserPage(uuid: user.id)
                        .environment(\.addUserPresentation, appDelegate.injection.addUserPresentation)
                } label: {
                    VStack {
                        Text(user.name)
                        Text(user.gender.rawValue)
                    }
                }

            }
            .onDelete { offsets in
                offsets.map { users[$0] }
                    .forEach { e in
                        delete(uuid: e.id)
                    }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                NavigationLink {
                    AddUserPage()
                        .environment(\.addUserPresentation, appDelegate.injection.addUserPresentation)
                } label: {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .navigationTitle("Users")
        .onAppear {
            presenter.getUsers(users: $users)
        }
    }
}

extension UsersPage {
    func delete(uuid: UUID) {
        presenter.delete(uuid: uuid)
    }
}

#if DEBUG
struct UsersPage_Previews: PreviewProvider {
    static var previews: some View {
        UsersPage()
    }
}
#endif
