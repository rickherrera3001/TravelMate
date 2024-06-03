//
//  SplashScreenView.swift
//  TravelMate
//
//  Created by Ricardo Developer on 31/05/24.
//

import SwiftUI


struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            LoginView()
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.6, green: 1.0, blue: 0.6), Color.white]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Image("logoTravelMate")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        .padding(.top, 05)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

#Preview {
    SplashScreenView()
}
