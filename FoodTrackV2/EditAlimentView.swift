//
//  EditAlimentView.swift
//  FoodTrackV2
//
//  Created by Raphael Morel on 30/11/2025.
//

import SwiftUI


struct EditAlimentView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var aliment: Aliment
    
    @State private var nom: String
        @State private var poidsDeReference: Double
        @State private var calories: Double
        @State private var lipides: Double
        @State private var glucides: Double
        @State private var proteines: Double
        
        init(aliment: Aliment) {
            self.aliment = aliment
            //Initialise tout les States avec les valeurs de l'aliment
            _nom = State(initialValue: aliment.nom)
            _poidsDeReference = State(initialValue: aliment.poidsDeReference)
            _calories = State(initialValue: aliment.calories)
            _lipides = State(initialValue: aliment.lipides)
            _glucides = State(initialValue: aliment.glucides)
            _proteines = State(initialValue: aliment.proteines)
        }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Nom")) {
                    TextField("Nom", text: $nom)
                }
                Section("Valeurs nutritionnelles") {
                    HStack {
                        Text("Poids de reference")
                        Spacer()
                        TextField("g", value: $poidsDeReference, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                        Text("g")
                    }
                    HStack {
                        Text("Calories")
                        Spacer()
                        TextField("kcal", value: $calories, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                        Text("kcal")
                    }
                    HStack {
                        Text("Lipide")
                        Spacer()
                        TextField("g", value: $lipides, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                        Text("g")
                    }
                    HStack {
                        Text("Glucides")
                        Spacer()
                        TextField("g", value: $glucides, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                        Text("g")
                    }
                    HStack {
                        Text("Protéines")
                        Spacer()
                        TextField("g", value: $lipides, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                        Text("g")
                    }
                    
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Annuler") {
                                dismiss()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Valider") {
                                aliment.nom = nom
                                aliment.poidsDeReference = poidsDeReference
                                aliment.calories = calories
                                aliment.lipides = lipides
                                aliment.glucides = glucides
                                aliment.proteines = proteines
                                dismiss()
                            }
                        }
                    }
                }
            }.navigationTitle("Modifier l'aliment")
        }
    }
}

#Preview {
    EditAlimentView(aliment: Aliment(nom: "Pates", poidsDeReference: 100, calories: 375, lipides: 2, glucides: 73, proteines: 13))
}
