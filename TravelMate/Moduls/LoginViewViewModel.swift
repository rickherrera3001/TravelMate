//
//  LoginViewModel.swift
//  TravelMate
//
//  Created by Ricardo Developer on 31/05/24.
//

//import SwiftUI
//import FirebaseAuth
//import FirebaseFirestore
//
//class LoginViewViewModel: ObservableObject {
//    @Published var email: String = ""
//    @Published var message: String = ""
//    @Published var password = ""
//    @Published var errorMessage = ""
//    @Published var forgotPasswordEmail = ""
//    @Published var forgotPasswordErrorMessage = ""
//    @Published var isForgotPasswordSuccess = false
//    @Published var name = ""
//    @Published var isAuthenticated: Bool = false
//    
//    init() {}
//    
//    func register() {
//        guard validateRegistration() else {
//            return
//        }
//        
//        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
//            if let error = error {
//                self?.errorMessage = error.localizedDescription
//                return
//            }
//            
//            guard let userId = result?.user.uid else {
//                self?.errorMessage = "Failed to retrieve user ID."
//                return
//            }
//            
//            self?.insertUserRecord(id: userId)
//        }
//    }
//    
//    private func insertUserRecord(id: String) {
//        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
//        
//        let db = Firestore.firestore()
//        db.collection("users").document(id).setData(newUser.asDictionary()) { [weak self] error in
//            if let error = error {
//                self?.errorMessage = "Failed to insert user record: \(error.localizedDescription)"
//            }
//        }
//    }
//    
//    func login() {
//        guard validateLogin() else {
//            return
//        }
//        
//        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//            if let error = error {
//                self?.errorMessage = error.localizedDescription
//                self?.isAuthenticated = false
//                return
//            }
//            
//            self?.errorMessage = ""
//            self?.isAuthenticated = true
//        }
//    }
//    
//    func forgotPassword() {
//        guard validateForgotPassword() else {
//            return
//        }
//        
//        Auth.auth().sendPasswordReset(withEmail: forgotPasswordEmail) { [weak self] error in
//            if let error = error {
//                self?.forgotPasswordErrorMessage = error.localizedDescription
//                self?.isForgotPasswordSuccess = false
//            } else {
//                self?.isForgotPasswordSuccess = true
//            }
//        }
//    }
//    
//    private func validateRegistration() -> Bool {
//        errorMessage = ""
//        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
//              !email.trimmingCharacters(in: .whitespaces).isEmpty,
//              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
//            errorMessage = "Please fill in all fields."
//            return false
//        }
//        
//        guard email.contains("@") && email.contains(".") else {
//            errorMessage = "Please enter a valid email."
//            return false
//        }
//        
//        guard password.count >= 6 else {
//            errorMessage = "Password must be at least 6 characters long."
//            return false
//        }
//        
//        return true
//    }
//    
//    private func validateLogin() -> Bool {
//        errorMessage = ""
//        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
//              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
//            errorMessage = "Please fill in all fields."
//            return false
//        }
//        
//        guard email.contains("@") && email.contains(".") else {
//            errorMessage = "Please enter a valid email."
//            return false
//        }
//        
//        guard password.count >= 6 else {
//            errorMessage = "Password must be at least 6 characters long."
//            return false
//        }
//        
//        return true
//    }
//    
//    private func validateForgotPassword() -> Bool {
//        forgotPasswordErrorMessage = ""
//        guard !forgotPasswordEmail.trimmingCharacters(in: .whitespaces).isEmpty else {
//            forgotPasswordErrorMessage = "Please enter your email address."
//            return false
//        }
//        
//        guard forgotPasswordEmail.contains("@") && forgotPasswordEmail.contains(".") else {
//            forgotPasswordErrorMessage = "Please enter a valid email address."
//            return false
//        }
//        
//        return true
//    }
//}
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

// Definición de la clase LoginViewViewModel que se adhiere al protocolo ObservableObject
class LoginViewViewModel: ObservableObject {
    // Declaración de variables @Published para que las vistas puedan observar sus cambios
    @Published var email: String = ""
    @Published var message: String = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var forgotPasswordEmail = ""
    @Published var forgotPasswordErrorMessage = ""
    @Published var isForgotPasswordSuccess = false
    @Published var name = ""
    @Published var isAuthenticated: Bool = false
    
    // Inicializador de la clase
    init() {}
    
    // Método para registrar un nuevo usuario
    func register() {
        // Validación del formulario de registro
        guard validateRegistration() else {
            return
        }
        
        // Creación de un nuevo usuario con Firebase Authentication
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                // Manejo de errores
                self?.errorMessage = error.localizedDescription
                return
            }
            
            guard let userId = result?.user.uid else {
                // Manejo de errores en caso de no obtener el ID del usuario
                self?.errorMessage = "Failed to retrieve user ID."
                return
            }
            
            // Inserción del registro del usuario en Firestore
            self?.insertUserRecord(id: userId)
        }
    }
    
    // Método privado para insertar un registro de usuario en Firestore
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary()) { [weak self] error in
            if let error = error {
                // Manejo de errores al insertar el registro del usuario
                self?.errorMessage = "Failed to insert user record: \(error.localizedDescription)"
            }
        }
    }
    
    // Método para iniciar sesión de un usuario existente
    func login() {
        // Validación del formulario de inicio de sesión
        guard validateLogin() else {
            return
        }
        
        // Autenticación del usuario con Firebase Authentication
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                // Manejo de errores de inicio de sesión
                self?.errorMessage = error.localizedDescription
                self?.isAuthenticated = false
                return
            }
            
            // Limpieza de mensajes de error y actualización del estado de autenticación
            self?.errorMessage = ""
            self?.isAuthenticated = true
        }
    }
    
    // Método para enviar un correo de restablecimiento de contraseña
    func forgotPassword() {
        // Validación del formulario de restablecimiento de contraseña
        guard validateForgotPassword() else {
            return
        }
        
        // Envío del correo de restablecimiento de contraseña con Firebase Authentication
        Auth.auth().sendPasswordReset(withEmail: forgotPasswordEmail) { [weak self] error in
            if let error = error {
                // Manejo de errores de restablecimiento de contraseña
                self?.forgotPasswordErrorMessage = error.localizedDescription
                self?.isForgotPasswordSuccess = false
            } else {
                // Actualización del estado de éxito del restablecimiento de contraseña
                self?.isForgotPasswordSuccess = true
            }
        }
    }
    
    // Método privado para validar el formulario de registro
    private func validateRegistration() -> Bool {
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters long."
            return false
        }
        
        return true
    }
    
    // Método privado para validar el formulario de inicio de sesión
    private func validateLogin() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email."
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters long."
            return false
        }
        
        return true
    }
    
    // Método privado para validar el formulario de restablecimiento de contraseña
    private func validateForgotPassword() -> Bool {
        forgotPasswordErrorMessage = ""
        guard !forgotPasswordEmail.trimmingCharacters(in: .whitespaces).isEmpty else {
            forgotPasswordErrorMessage = "Please enter your email address."
            return false
        }
        
        guard forgotPasswordEmail.contains("@") && forgotPasswordEmail.contains(".") else {
            forgotPasswordErrorMessage = "Please enter a valid email address."
            return false
        }
        
        return true
    }
}
