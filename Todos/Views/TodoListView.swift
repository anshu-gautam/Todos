//
//  TodoListView.swift
//  Todos
//
//  Created by Akhil Gautam on 01/04/24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel : TodoListViewViewModel
    @FirestoreQuery var items :[TodoListItem]
    
   
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "Users/\(userId)/todos"
        )
        self._viewModel = StateObject(
        wrappedValue: TodoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items){
                    item in
                    TodoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                                
                            } .tint(Color(.red))
                        }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("To Do list")
            .toolbar{
                Button{
                    viewModel.showNewItemiew = true
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showNewItemiew) {
                NewItemView(newItemPresented: $viewModel.showNewItemiew )
            }
        }
    }
}

#Preview {
    TodoListView(userId: "hh9RZCD70QPpNu5b6y9NEMewsj33")
}
