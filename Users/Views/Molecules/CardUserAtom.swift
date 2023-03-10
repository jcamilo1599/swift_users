//
//  CardAtom.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 23/12/22.
//

import SwiftUI

struct CardUserAtom: View {
    var user: UserModel
    
    var body: some View {
        Section {
            VStack(alignment:.leading) {
                Text(user.name)
                    .foregroundColor(.orange)
                    .font(.system(size: 26, weight: .semibold))
                    .padding(.bottom, 10)
                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.orange)
                    Text(user.phone)
                }
                .padding(.bottom, 2)
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.orange)
                    Text(user.email)
                }
            }
            
            NavigationLink {
                PostsPage(user: user)
            } label: {
                Text("VIEW POSTS")
            }
        }
    }
}

struct CardUserAtom_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CardUserAtom(user: UserModel(
                id: 0,
                name: "Juan",
                email: "juancamilomarinochoa@gmail.com",
                phone: "3000000000"
            ))
        }
    }
}
