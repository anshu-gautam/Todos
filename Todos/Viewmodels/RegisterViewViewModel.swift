//
//  RegisterViewViewModel.swift
//  Todos
//
//  Created by Akhil Gautam on 01/04/24.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation
class RegisterViewViewModel:ObservableObject {
    
    @Published var email = ""
    @Published var name = ""
    @Published var password = ""
    init () {}

    func register () {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userId = result?.user.uid else {
            return
            }
            self?.insertuserRecord(id: userId)
        }
     
    }
    private func insertuserRecord(id: String){
        let newUser = User(id: id, name: name, email:email, joined:Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("Users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }

    private func validate () -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
    //        errorMessage = "Please fill in all the fields"
            return false
            }
        guard email.contains("@") && email.contains(".") else {
            
        
            return false
        }
        guard password.count >= 6 else {
            return false
        }
        return true
        
    }
    

}
