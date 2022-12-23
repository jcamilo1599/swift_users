//
//  SplashScreenView.swift
//  Users
//
//  Created by Juan Camilo Marín Ochoa on 22/12/22.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isLoading = false
    var show: Bool
    
    var body: some View {
        ZStack {
            if (show) {
                backgroundView
                animationView
            }
        }
    }
    
    private var backgroundView:some View {
        Spacer()
            .background(LinearGradient(
                gradient: Gradient(colors: [
                    Color(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)), // FFFFFF
                    Color(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)), // FFFFFF
                    Color(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)), // FFFFFF
                    Color(UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.00)) // CCCCCC
                ]),
                startPoint: .top,
                endPoint: .bottom
            ))
            .ignoresSafeArea()
    }
    
    private var animationView:some View {
        Circle()
            .trim(from: 0, to: 0.4)
            .stroke(Color.orange, lineWidth: 5)
            .frame(width: 100, height: 100)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(
                .linear(duration: 1).repeatForever(autoreverses: false), value: isLoading
            )
            .onAppear {
                isLoading = true
            }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(show: true)
    }
}
