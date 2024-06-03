//
//  LoginView.swift
//  TravelMate
//
//  Created by Ricardo Developer on 31/05/24.
//

import SwiftUI

        struct LoginView: View {
            @AppStorage("isLoggedIn") private var isLoggedIn = false
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
                                HStack {
                                    Image("logoTravelMate")
                                                                  .resizable()
                                                                  .aspectRatio(contentMode: .fit)
                                                                  .frame(width: 110)
                                                                  .padding(.bottom, 60.0)
                                                                  .padding(.top, 50)
                                }
                            }
                            .padding(.bottom, 10)
                            
                            Spacer()
                            
                            VStack(spacing: 18) {
                                if !viewModel.errorMessage.isEmpty {
                                    Text(viewModel.errorMessage)
                                        .foregroundColor(Color.red)
                                }
                                    
                                TextField("Email Address", text: $viewModel.email)
                                    .padding()
                                    .background(Color.white.opacity(0.5))
                                    .cornerRadius(10)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .autocapitalization(.none)
                                
                                SecureField("Password", text: $viewModel.password)
                                    .padding()
                                    .background(Color.white.opacity(0.5))
                                    .cornerRadius(10)
                                    .textFieldStyle(PlainTextFieldStyle())
                                
                                Button(action: {
                                    viewModel.login()
                                }) {
                                    Text("Log In")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.blue.opacity(0.2))
                                        .cornerRadius(10)
                                }
                                NavigationLink("Forgotten your password?", destination: ForgotPasswordView(viewModel: viewModel))
                                    .foregroundColor(.white)
                                    .padding(.top, 10)
                            }
                            .padding()
                            
                            VStack {
                                Text("New around here?")
                                    .foregroundColor(.white)
                                
                                NavigationLink("Create An Account", destination: RegisterView(viewModel: viewModel))
                            }
                            .padding(.bottom, 100)
                            
                            Spacer()
                            
                            NavigationLink(
                                destination: HomeView(),
                                isActive: $viewModel.isAuthenticated
                            ) {
                                EmptyView()
                            }.hidden()
                        }
                        .padding()
                    }
                }
            }
        }

        #Preview {
            LoginView()
        }

