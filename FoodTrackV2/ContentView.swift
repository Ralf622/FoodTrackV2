//
//  ContentView.swift
//  FoodTrackV2
//
//  Created by Raphael Morel on 06/11/2025.
//

import SwiftUI

@Observable
class MyAliments {
    var aliments = [Aliment]()
    
}


struct ContentView: View {
    
    @State private var myAliments = MyAliments()
    
    var body: some View {
        TabView {
            Tab("Récap Journalier", systemImage: "star"){
                RecapView(myAliments: myAliments)
            }
            
            Tab("Saisie", systemImage: "square.and.pencil"){
                CreateAlimentView(myAliments: myAliments)
            }
            
        }
    }
}


#Preview {
    ContentView()
}
