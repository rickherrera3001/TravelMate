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
        @StateObject private var viewModel = TravelMateViewModel()
        @State   private var searchBar: String = ""
        
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
                    
                        
                        SearchBar(text: $searchBar, onSearchButtonClicked: {
                            viewModel.searchDestinations(query: searchBar)
                                                })
                                                .padding(.bottom, 20)
                        
                       
                        ScrollView {
                                                if let filteredTravels = viewModel.filteredTravels {
                                                    ForEach(filteredTravels, id: \.title) { travel in
                                                        VStack(alignment: .leading) {
                                                            Text(travel.title)
                                                                .font(.headline)
                                                            AsyncImage(url: URL(string: travel.imageURL)) { phase in
                                                                switch phase {
                                                                case .empty:
                                                                    ProgressView()
                                                                case .success(let image):
                                                                    image
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fill)
                                                                        .frame(height: 200)
                                                                        .clipped()
                                                                case .failure:
                                                                    Image(systemName: "photo")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                                        .frame(height: 200)
                                                                @unknown default:
                                                                    EmptyView()
                                                                }
                                                            }
                                                            Divider()
                                                        }
                                                        .padding()
                                                        .background(Color.white)
                                                        .cornerRadius(8)
                                                        .shadow(radius: 5)
                                                        .padding(.horizontal)
                                                    }
                                                } else {
                                                    Text("No se encontraron destinos.")
                                                        .font(.subheadline)
                                                        .foregroundColor(.gray)
                                                }
                                            }
                                            .padding(.top, 10)
                                            
                                            Spacer()
                    
                        
                    }
                }
            }
            .onAppear {
                viewModel.fetchTravelMate()
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    var onSearchButtonClicked: () -> Void

    var body: some View {
        VStack {
            HStack {
                TextField("Buscar destinos", text: $text, onCommit: {
                    onSearchButtonClicked()
                })
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
            }
            Text("DESTINOS")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
        }
    }
}


struct PopularDestinations: View {
    let destination: CountryImage

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: destination.imageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            Text(destination.title)
                .foregroundColor(.primary)
                .frame(width: 150)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding(.horizontal, 5)
    }
}



#Preview{
    HomeView()
}
