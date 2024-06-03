//
//  ForgotView.swift
//  TravelMate
//
//  Created by Ricardo Developer on 01/06/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject var viewModel: LoginViewViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "lock.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .foregroundColor(.white)
            
            
            Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 50)
            
            TextField("Email Address", text: $viewModel.forgotPasswordEmail)
                .padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(10)
                .textFieldStyle(PlainTextFieldStyle())
                .autocapitalization(.none)
                .padding(.top, 50)
            
            if !viewModel.forgotPasswordErrorMessage.isEmpty {
                Text(viewModel.forgotPasswordErrorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            if viewModel.isForgotPasswordSuccess {
                Text("A password reset link has been sent to your email.")
                    .foregroundColor(.green)
                    .padding()
            }
            
            Button(action: {
                viewModel.forgotPassword()
            }) {
                Text("Send Password Reset Link")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 20)
            }
            
            Spacer()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]),
                                   startPoint: .top,
                                   endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ForgotPasswordView(viewModel: LoginViewViewModel())
}

