//
//  AddFoodIntakeView.swift
//  FoodTrackV2
//
//  Created by Raphael Morel on 30/11/2025.
//

import SwiftUI
import SwiftData

struct AddFoodIntakeView: View {
    @Query var Aliments: [Aliment]
    @Query var ApportsJournalier : [ApportJournalier]
    @Environment(\.modelContext) var modelContext
    
    @State private var selectedAliment = Aliment(nom: "Aucun", poidsDeReference: 0, calories: 0, lipides: 0, glucides: 0, proteines: 0)
    @State private var poids: Double = 0
    
    var body: some View {
        NavigationStack {
            Form{
                Section("Ajouter une portion"){
                    Picker("Aliment", selection: $selectedAliment) {
                        ForEach(Aliments) { food in
                            Text(food.nom).tag(food)
                        }
                    }
                    HStack{
                        TextField("Poids", value: $poids, format: .number)
                            .keyboardType(.decimalPad)
                        Spacer()
                        Text("g")
                        
                    }
                    Button("Add"){
                        let todayApportJournalier = getOrCreateTodayApportJournalier()
                        let newPortions = Portion(aliment: selectedAliment, quantité: poids)
                        todayApportJournalier.portions.append(newPortions)
                    }
                }
                Section("Ajouter un repas"){
                    // A faire !!!!
                }
                Section{
                    NavigationLink{
                        ListAlimentView()
                    }
                    label: {
                        Text("Afficher la liste des aliments ")
                    }
                }
            }
            .navigationTitle("Ajouter un apport")
        }
        .onAppear {
            if let first = Aliments.first {
                    selectedAliment = first
            }
        }
    }
    func getOrCreateTodayApportJournalier() -> ApportJournalier {
        let today = Calendar.current.startOfDay(for: Date())
        
        if let existing = ApportsJournalier.first(where: { Calendar.current.isDate($0.date, inSameDayAs: today) }) {
                return existing
        }
        let newApportJournalier = ApportJournalier(date: today)
        modelContext.insert(newApportJournalier)
        return newApportJournalier
        
    }
}


#Preview {
    AddFoodIntakeView()
}
