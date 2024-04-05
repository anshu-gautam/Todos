//
//  ProfileView.swift
//  Todos
//
//  Created by Akhil Gautam on 01/04/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user:user)
                    
                } else {
                    Text("loading...")
                }
            }
            .navigationTitle("Profile")
            
        } .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile (user: User) -> some View{
        
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .padding()
            VStack(alignment: .leading){
                HStack{
                    Text("Name: ")
                        .bold()
                    Text(user.name)
                }
                .padding()
                HStack{
                    Text("Email: ")
                        .bold()
                    Text(user.email)
                }
                .padding()
                HStack{
                    Text("Member Since: ")
                        .bold()
                    Text("\(Date(timeIntervalSince1970:user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
            }
            .padding()
            
            Button("Log out"){
                viewModel.logOut()
                
            }
            .tint(.red)
            .padding()
            Spacer()
    }
}

#Preview {
    ProfileView()
}
