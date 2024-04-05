//
//  TodosApp.swift
//  Todos
//
//  Created by Akhil Gautam on 31/03/24.
//
import FirebaseCore

import SwiftUI

@main
struct TodosApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
