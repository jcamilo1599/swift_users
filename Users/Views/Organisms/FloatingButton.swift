//
//  FloatingButton.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 25/12/22.
//

import SwiftUI

struct FloatingButton: View {
    var action: () -> Void
    var icon: String
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(
                    action: action,
                    label: {
                        Image(systemName: icon)
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color.white)
                    }
                )
                .background(.orange)
                .cornerRadius(100)
                .padding(.horizontal)
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 3,
                    x: 0,
                    y: 0
                )
            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(action: {}, icon: "phone.fill")
    }
}
