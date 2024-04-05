//
//  TodoListItemView.swift
//  Todos
//
//  Created by Akhil Gautam on 01/04/24.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewViewModel()
    let item : TodoListItem
    var body: some View {
        HStack{
            VStack (alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened ))")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button {
                viewModel.toggleIsDone(item: item)
                
            } label :{
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
                
            }
            
        }
    }
}

#Preview {
    TodoListItemView(item: .init(id: "123", title: "test", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
