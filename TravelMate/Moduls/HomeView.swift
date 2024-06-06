//
//  HomeViewView.swift
//  TravelMate
//
//  Created by Ricardo Developer on 31/05/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                
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
                .accentColor(.blue)
            }
        }
    }
    
    struct ExploreView: View {
        @State private var searchText: String = ""
        
        var body: some View {
            NavigationView {
                ZStack{
                    
                    LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 20){
                        
                        Image("logoTravelMate")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150)
                            .padding(.bottom, 20)
                            .padding(.top, 5)
                        
                        Text("Explorar Destinos")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 5)
                        
                        TextField("Buscar destinos", text: $searchText)
                            .padding(7)
                            .padding(.horizontal, 25)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.horizontal, 10)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 10)
                                }
                            )
                            .padding(.bottom, 20)
                        
                        ScrollView {
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 42.0, height: 42.0)
                                .padding(.horizontal, 30)
                            
                        }
                        
                        Spacer()
                        
                    }
                }
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



#Preview{
    HomeView()
}

