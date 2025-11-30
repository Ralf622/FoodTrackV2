//
//  RecapView.swift
//  FoodTrackV2
//
//  Created by Raphael Morel on 07/11/2025.
//

import SwiftUI
import SwiftData


struct RecapView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var Aliments: [Aliment]
    
    var body: some View {
        NavigationStack{
            ForEach (Aliments) { aliment in
                Section(aliment.nom){
                    Text("Calories:\(aliment.calories)")
                }
            }
            
        }
    }
}

#Preview {
    RecapView()
}
