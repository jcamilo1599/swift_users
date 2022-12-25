//
//  CardPostAtom.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 24/12/22.
//

import SwiftUI

struct CardPostAtom: View {
    @State var showBody = false
    
    var post: PostsModel
    
    var body: some View {
        Section {
            Text(post.title)
                .foregroundColor(.orange)
            Text(post.body)
        }
    }
}

struct CardPostAtom_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CardPostAtom(post: PostsModel(
                id: 1,
                title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
                
            ))
        }
    }
}
