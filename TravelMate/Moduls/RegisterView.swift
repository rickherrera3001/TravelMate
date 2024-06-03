//
//  RegisterView.swift
//  TravelMate
//
//  Created by Ricardo Developer on 31/05/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.6, green: 1.0, blue: 0.6), Color.blue]),
                                               startPoint: .top,
                                               endPoint: .bottom)
                                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(spacing: 10) {
                        Text("Register")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("Start looking for destinations")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding(.bottom)
                    .padding(.top)
                    
                    Spacer()
                    
                    TextField("Full Name", text: $viewModel.name)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Email Address", text: $viewModel.email)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                    
                    
                    
                    Button(action: {
                        viewModel.register()
                        
                    }) {
                        Text("Register")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                        
                    }
                    Spacer()
                }
                .padding()
            
            }
        }
    }
}

#Preview {
    RegisterView()
}
