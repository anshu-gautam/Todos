//
//  TodoListViewViewModel.swift
//  Todos
//
//  Created by Akhil Gautam on 01/04/24.
//
import FirebaseFirestore
import Foundation
class TodoListViewViewModel:ObservableObject{
    @Published var showNewItemiew = false
    
    private let userId : String
    init (userId: String){
        self.userId = userId
    }
    func delete (id: String){
        let db = Firestore.firestore()
        db.collection("Users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
