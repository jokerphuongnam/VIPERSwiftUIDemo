//
//  AddUserPage.swift
//  ViperDemo
//
//  Created by P.Nam on 15/09/2022.
//

import SwiftUI

struct AddUserPage: View {
    @Environment(\.addUserPresentation) private var presenter
    private let uuid: UUID?
    @State private var name: String = ""
    @State private var gender: Gender = .secret
    @Environment(\.presentationMode) private var presentationMode
    @State private var isShowAddImagePage: Bool = false
    
    init(uuid: UUID? = nil) {
        self.uuid = uuid
    }
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
            Picker("Gender", selection: $gender) {
                ForEach(Gender.allCases, id: \.self) { e in
                    Text(e.rawValue)
                        .padding()
                }
            }
            .pickerStyle(.menu)
            .padding()
            
            Button {
                isShowAddImagePage.toggle()
            } label: {
                Text("Add Image")
                    .padding()
            }
            
            Button {
                addUser()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Submit")
                    .padding()
            }
        }
        .padding()
        .navigationTitle(uuid == nil ? "Add User": "Update User")
        .sheet(isPresented: $isShowAddImagePage) {
            #if DEBUG
            print("Dismiss \(String(describing: AddImagePage.self))")
            #endif
        } content: {
            AddImagePage()
                .environment(\.addImagePresentation, appDelegate.injection.addImagePresenter)
        }
    }
}

extension AddUserPage {
    func addUser() {
        if let uuid = uuid {
            presenter.update(uuid: uuid, name: name, gender: gender)
        } else {
            presenter.addUser(name: name, gender: gender)
        }
    }
}

#if DEBUG
struct AddUserPage_Previews: PreviewProvider {
    static var previews: some View {
        AddUserPage()
    }
}
#endif
