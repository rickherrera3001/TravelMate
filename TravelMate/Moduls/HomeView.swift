//
//  WelcomeView.swift
//  TravelMate
//
//  Created by Ricardo Developer on 31/05/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.6, green: 1.0, blue: 0.6), Color.blue]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                TabView {
                    ExploreView()
                        .tabItem {
                            Label("Explorar", systemImage: "magnifyingglass")
                        }
                    
                    PlanTripView()
                        .tabItem {
                            Label("Planificar", systemImage: "calendar")
                        }
                    
                    ItineraryView()
                        .tabItem {
                            Label("Itinerario", systemImage: "list.bullet")
                        }
                    
                    ProfileView()
                        .tabItem {
                            Label("Perfil", systemImage: "person")
                        }
                    
                    CommunityView()
                        .tabItem {
                            Label("Comunidad", systemImage: "person.3")
                        }
                }
            }
        }
    }
    
    struct ExploreView: View {
        var body: some View {
            NavigationView {
                Text("Explorar Destinos")
                    .navigationTitle("Explorar")
            }
        }
    }
    
    struct PlanTripView: View {
        var body: some View {
            NavigationView {
                Text("Planificar Viaje")
                    .navigationTitle("Planificar")
            }
        }
    }
    
    struct ItineraryView: View {
        var body: some View {
            NavigationView {
                Text("Itinerario del Viaje")
                    .navigationTitle("Itinerario")
            }
        }
    }
    
    struct ProfileView: View {
        var body: some View {
            NavigationView {
                Text("Perfil del Usuario")
                    .navigationTitle("Perfil")
            }
        }
    }
    
    struct CommunityView: View {
        var body: some View {
            NavigationView {
                Text("Comunidad")
                    .navigationTitle("Comunidad")
            }
        }
    }
}

// Extensiones para definir los colores
extension Color {
    static let backgroundColor = Color("BackgroundColor")
    static let tabActiveColor = Color("TabActiveColor")
    static let tabInactiveColor = Color("TabInactiveColor")
    static let primaryButtonColor = Color("PrimaryButtonColor")
    static let secondaryButtonColor = Color("SecondaryButtonColor")
}

#Preview{
    HomeView()
}

