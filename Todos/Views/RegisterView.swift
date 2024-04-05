//
//  RegisterView.swift
//  Todos
//
//  Created by Akhil Gautam on 01/04/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
   
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start organising todos", angle: -15, bgColor: .green)
            
            Form{
                TextField("Full name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Create Account", bgColor: .green){
//                    Registration
                    viewModel.register()
                }
                .padding()
            }
            
        }
        .offset(y:-50)
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
