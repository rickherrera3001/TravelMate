//
//  TravelDetailView.swift
//  TravelMate
//
//  Created by Ricardo Developer on 10/06/24.
//

import SwiftUI

struct TravelDetailView: View {
    var travelDetail: TravelMate
    @ObservedObject var viewModel = DetailViewModel.shared
    @State private var isFavorite: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                AsyncImage(url: URL(string: travelDetail.data.imageURL)) { image in
                    switch image {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                            .shadow(color: Color.black, radius: 5)
                            .padding(.top, 50)
                    case .failure(_):
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .foregroundColor(.gray)
                            .padding(.top, 50)
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding(.top, 30)
                
                Text(travelDetail.data.info)
                    .foregroundColor(.orange)
                    .font(.title)
                    .padding(.top, 20)
                
                Text(travelDetail.data.info)
                    .foregroundColor(.orange)
                    .font(.headline)
                    .padding(.top, 5)
                
                Text(travelDetail.data.info)
                    .foregroundColor(.orange)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Spacer()
                
                Button(action: {
                    if isFavorite {
                        viewModel.removeFromFavorites(detalleDestinos: travelDetail)
                    } else {
                        viewModel.addToFavorites(detalleDestinos: travelDetail)
                    }
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "square.and.arrow.down" : "square.and.arrow.down.fill")
                        .foregroundColor(isFavorite ? .yellow : .orange)
                        .font(.title)
                        .padding()
                }
                .padding(.bottom, 30)
            }
            .padding(.horizontal)
        }
                .onAppear {
                    isFavorite = viewModel.isFavorite(detalleDestinos:  travelDetail)
                }
                .onChange(of: viewModel.favorites) { _ in
                            isFavorite = viewModel.isFavorite(detalleDestinos: travelDetail)
        }
    }
}
