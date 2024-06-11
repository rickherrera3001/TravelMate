//
//  ProfileView.swift
//  TravelMate
//
//  Created by Ricardo Developer on 03/06/24.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: SaveData
    @State private var nombreUsuario:String = "Perfil"
    //@State var imagenPerfil:UIImage = UIImage(named: "ejemploFoto")!
    @State private var imagenPerfil: UIImage = UIImage(named: "ejemploFoto") ?? UIImage(systemName: "person.crop.circle")!
    
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                
                VStack{
                    
                    
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                    
                    
                }.padding(EdgeInsets(top: 64, leading: 0, bottom: 32, trailing: 0))
                
                
                Text("Ajustes")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,  alignment: .leading).padding(.leading,18)
                
                
                ModuloAjustes()
                
                Spacer()
            }
            
            
        } .onAppear(
            
            perform: {
                
                
                //validar cuando no hay foto guardada
                
                if returnUiImage(named: "fotoperfil") != nil {
                    
                    imagenPerfil = returnUiImage(named: "fotoperfil")!
                    
                }else{
                    print("no encontre foto de perfil en base de datos")
                    
                }
                
                print("revisando si tengo datos en user defaults")
                
                if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
                    
                    nombreUsuario = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
                    print("Si encontre nombre de usuario \(nombreUsuario)")
                }else{
                    
                    print("no encontre nombre de usuario guardado en objeto global de userdefaults")
                    
                }
            }
        )
    }
    
    
    func returnUiImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
}


struct ModuloAjustes:View {
    
    @State private var isToggleOn = true
    @State private var isEditProfileViewActive = false
    
    var body: some View{
        
        
        VStack{
            
            Button(action: {}, label: {
                HStack { Text("Cuenta")
                        .foregroundColor(Color.green)
                    Spacer()
                    Text(">")
                    .foregroundColor(Color.white)}.padding()
            }) .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
            Button(action: {}, label: {
                HStack { Text("Notificaciones")
                        .foregroundColor(Color.green)
                    Spacer()
                    
                    Toggle("", isOn: $isToggleOn)
                    
                }.padding()
            }) .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
            Button(action: {isEditProfileViewActive = true}, label: {
                HStack { Text("Editar Perfil")
                        .foregroundColor(Color.green)
                    Spacer()
                    Text(">")
                    .foregroundColor(Color.white)}.padding()
            }) .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 1.0)).padding(.horizontal, 8.0)
            
        }
    }
}


#Preview {
    ProfileView(viewModel: SaveData())
}

