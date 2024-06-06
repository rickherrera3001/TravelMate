//
//  HomeViewView.swift
//  TravelMate
//
//  Created by Ricardo Developer on 31/05/24.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab: Int = 2
    var body: some View {
        NavigationView {
            ZStack {
                
                TabView(selection: $selectedTab) {
                    
                    
                    ExploreView()
                        .tabItem {
                            Label("Explorar", systemImage: "magnifyingglass")
                        }.tag(0)
                    
                    PlanTripView()
                        .tabItem {
                            Label("Planificar", systemImage: "calendar")
                        }.tag(1)
                    
                    ItineraryView()
                        .tabItem {
                            Label("Itinerario", systemImage: "list.bullet")
                        }.tag(2)
                    
                    ProfileView(viewModel: SaveData())
                        .tabItem {
                            Label("Perfil", systemImage: "person")
                        }.tag(3)
                    
                    CommunityView()
                        .tabItem {
                            Label("Comunidad", systemImage: "person.3")
                        }.tag(4)
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
}

#Preview{
    HomeView()
}
