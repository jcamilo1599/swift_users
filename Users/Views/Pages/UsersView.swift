//
//  UsersView.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 22/12/22.
//

import SwiftUI

struct UsersView: View {
    @State private var users: [UserModel] = []
    @State private var showLoading = true
    
    var body: some View {
        NavigationView {
            Text("Usuarios...")
        }
        .overlay(SplashScreenView(show: showLoading))
        .onAppear() {
            getUsers()
        }
    }
    
    private func getUsers() {
        UsersNetworks.shared.getUsers { response in
            hideLoading()
            users.append(contentsOf: response)
        } failure: { error in
            hideLoading()
        }
    }
    
    private func hideLoading(){
        withAnimation(.spring()) {
            showLoading.toggle()
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
