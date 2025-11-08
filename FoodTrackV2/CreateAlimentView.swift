//
//  CreateAlimentView.swift
//  FoodTrackV2
//
//  Created by Raphael Morel on 07/11/2025.
//

import SwiftUI

struct CreateAlimentView: View {
    
    @State private var nom = ""
    @State private var poidsDeReference = 0.0
    @State private var calories = 0.0
    @State private var lipides = 0.0
    @State private var glucides = 0.0
    @State private var proteines = 0.0

    var myAliments: MyAliments
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Nom", text: $nom)
                HStack{
                    TextField("Poids de référence", value: $poidsDeReference, format: .number)
                        .keyboardType(.decimalPad)
                    Spacer()
                    Text("g")
                    
                }
                HStack{
                    TextField("Calories", value: $calories, format: .number)
                        .keyboardType(.decimalPad)
                    Spacer()
                    Text("kcal")
                    
                }
                HStack{
                    TextField("Lipides", value: $lipides, format: .number)
                        .keyboardType(.decimalPad)
                    Spacer()
                    Text("g")
                    
                }
                HStack{
                    TextField("Glucides", value: $glucides, format: .number)
                        .keyboardType(.decimalPad)
                    Spacer()
                    Text("g")
                    
                }
                HStack{
                    TextField("Proteines", value: $proteines, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Text("g")
                    
                }
                Button("Save"){
                    let aliment = Aliment(nom: nom, poidsDeReference: poidsDeReference, calories: calories, lipides: lipides, glucides: glucides, proteines: proteines)
                    myAliments.aliments.append(aliment)
                    
                    
                    
                }
                Section{
                    Button("Add test"){
                        
                        let aliment = Aliment(nom: "TestAliment", poidsDeReference: 100.0, calories: 373.4, lipides: 4.2, glucides: 78.0, proteines: 4.3)
                        myAliments.aliments.append(aliment)
                    }
                }
                Section{
                    NavigationLink{
                        ListAlimentView(myAliments: myAliments)
                    }
                    label: {
                        Text("Afficher la liste des aliments ")
                    }
                }
            }
        }
    
    }
    
}

#Preview {
    CreateAlimentView(myAliments: MyAliments())
}
