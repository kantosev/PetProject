//
//  UpdateAccountScreenView.swift
//  PetProject
//
//  Created by Антон Кирилюк on 18.12.2022.
//

import SwiftUI

struct UpdateAccountScreenView: View {
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var age: String = ""
    @State private var renameDataSuccessful: Bool = false
    @State private var renameDataError: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    private var signManager: SignManagerProtocol? = SignManager()
    
    var body: some View {
        VStack {
            TextFieldView(textFieldText: $userName, placeholder: Text("Введите новое имя пользователя"))
            TextFieldView(textFieldText: $email, placeholder: Text("Введите новый email"))
            TextFieldView(textFieldText: $age, placeholder: Text("Введите новый возраст"))
            Spacer()
        }
        .toolbar {
            Button("Save") {
                guard let user = User.current?.username else { renameDataError.toggle()
                    return
                }
                signManager?.updateAccount(userName: userName, email: email, age: age, successCompletion: {
                    DispatchQueue.main.async {
                        dismiss()
                    }
                    renameDataSuccessful.toggle()
                    guard let backgroundColor = UserDefaults.standard.object(forKey: user) as? [CGFloat] else { return }
                    UserDefaults.standard.set(backgroundColor, forKey: userName)
                }, errorCompletion: { error in
                    print(error.localizedDescription)
                    renameDataError.toggle()
                })
            }
            .alert("Информация аккаунта обновлена успешно", isPresented: $renameDataSuccessful) {}
            .alert("Ошибка. Данные не изменены.", isPresented: $renameDataError) { }

        }
           
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
        
    }
}

struct UpdateAccountScreenView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateAccountScreenView()
    }
}
