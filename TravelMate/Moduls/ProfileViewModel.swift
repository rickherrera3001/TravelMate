//
//  ProfileViewModel.swift
//  TravelMate
//
//  Created by Ricardo Developer on 03/06/24.
//

import Foundation

import SwiftUI

class SaveData: ObservableObject {
    var correo:String = ""
    var contrasena:String = ""
    var nombre:String = ""
    @Published var imagenPerfil: UIImage = UIImage(named: "ejemploFoto") ?? UIImage(systemName: "person.fill")!
    
    
    func guardarDatos(correo:String,contrasena:String,nombre:String) -> Bool {
        
        print("Dentro de funcion Guardar Datos obtuve: \(correo) + \(contrasena) + \(nombre)")
        UserDefaults.standard.set([correo,contrasena,nombre], forKey: "datosUsuario")
        
        return true
    }
    
    func recuperarDatos() -> [String] {
        
        let datosUsuario:[String] = UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        
        print("Estoy en metodo recuperar datos y recupere: \(datosUsuario)")
        
        return datosUsuario
    }
    
    
    func validar(correo:String,contrasena:String) -> Bool {
        
        var correoGuardado = ""
        var contraseñaGuardada = ""
        
        print("revisando si tengo datos en user defaults con correo: \(correo) y contraseña: \(contrasena)")
        
        
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
            
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            
            contraseñaGuardada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            
            print("El correo guardado es: \(correoGuardado) y la contraseña guardada es: \(contraseñaGuardada)")
            
            if (correo == correoGuardado && contrasena == contraseñaGuardada){
                return true
            }else{
                return false
            }
            
        }else{
            
            print("No hay datos de usuario grabados en el objeto global de userdefaults")
            return false
        }
        
    }
    
}
