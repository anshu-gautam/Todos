//
//  TodoListItemViewViewModel.swift
//  Todos
//
//  Created by Akhil Gautam on 01/04/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class TodoListItemViewViewModel:ObservableObject{
    init (){}
    
    func toggleIsDone(item: TodoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
            db.collection("Users")
            .document(uId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
