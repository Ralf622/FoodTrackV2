//
//  ContentView.swift
//  FoodTrackV2
//
//  Created by Raphael Morel on 06/11/2025.
//

import SwiftUI
import SwiftData




struct ContentView: View {

    var body: some View {
        TabView {
            Tab("Saisie", systemImage: "square.and.pencil"){
                AddFoodIntakeView()
            }
            
            Tab("Récap Journalier", systemImage: "star"){
                RecapView()
            }
            
        }
    }
}


#Preview {
    ContentView()
}
