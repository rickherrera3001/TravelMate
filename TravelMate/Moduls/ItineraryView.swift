//
//  ItineraryView.swift
//  TravelMate
//
//  Created by Ricardo Developer on 05/06/24.
//

import SwiftUI

struct ItineraryView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ItineraryView()
}
