//
//  CardAtom.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 23/12/22.
//

import SwiftUI

struct CardAtom: View {
    var user: UserModel
    
    var body: some View {
        Section {
            VStack(alignment:.leading) {
                Text(user.name)
                    .foregroundColor(.orange)
                    .font(.system(size: 26, weight: .semibold))
                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.orange)
                    Text(user.phone)
                }
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.orange)
                    Text(user.email)
                }
            }
            
            NavigationLink {
                EmptyView()
            } label: {
                Text("VIEW POSTS")
                    .foregroundColor(.orange)
            }
        }
    }
}

struct CardAtom_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CardAtom(user: UserModel(
                id: 0,
                name: "Juan",
                username: "juan",
                email: "juancamilomarinochoa@gmail.com",
                phone: "3005190365",
                website: "",
                address: Address(
                    street: "",
                    suite: "",
                    city: "",
                    zipcode: "",
                    geo: Geo(lat: "", lng: "")
                ),
                company: Company(name: "", catchPhrase: "", bs: "")
            ))
        }
    }
}
