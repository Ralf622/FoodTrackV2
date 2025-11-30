//
//  ListAlimentView.swift
//  FoodTrackV2
//
//  Created by Raphael Morel on 07/11/2025.
//

import SwiftUI
import SwiftData

struct ListAlimentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var Aliments: [Aliment]
    
    
    @State private var selectedAliment: Aliment?
    
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(Aliments) { aliment in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(aliment.nom)
                                .font(.headline)
                            Spacer()
                            Button("Modifier") {
                               selectedAliment=aliment
                            }
                            .buttonStyle(.bordered)
                        }
                        Text("Calories: \(aliment.calories, specifier: "%.0f") kcal")
                        Text("Protéines: \(aliment.proteines, specifier: "%.1f") g")
                        Text("Glucides: \(aliment.glucides, specifier: "%.1f") g")
                        Text("Lipides: \(aliment.lipides, specifier: "%.1f") g")
                    }
                }
                .onDelete(perform: supprimerAliment)
            }
            .navigationTitle("Liste des aliments")
            .sheet(item: $selectedAliment) { aliment in
                EditAlimentView(aliment: aliment)
            }
        }
        
    }
    
    func supprimerAliment(at offsets : IndexSet){
        for offset in offsets{
            let aliment = Aliments[offset]
            modelContext.delete(aliment)
        }
        
    }
}


    

#Preview {
    ListAlimentView()
}
