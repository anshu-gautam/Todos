//
//  LoginView.swift
//  Todos
//
//  Created by Akhil Gautam on 01/04/24.
//

import SwiftUI


struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                HeaderView(title: "To do list", subtitle: "Get things done", angle: 15, bgColor: .pink)
                
    //            Login
                Form{
                    if !viewModel.errorMessage.isEmpty{ Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                        
                    }
                    TextField("Email Addresss", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Login", bgColor: .blue){
                        viewModel.login()
                    }
                    .padding()
                   
                }
                .offset(y:-50)
                
                VStack{
                    Text("New Around here")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)

                Spacer()
                
            }
        }
    }
}

#Preview {
    LoginView()
}
