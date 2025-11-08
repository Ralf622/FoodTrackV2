//
//  ListAlimentView.swift
//  FoodTrackV2
//
//  Created by Raphael Morel on 07/11/2025.
//

import SwiftUI

struct ListAlimentView: View {
    
    var myAliments: MyAliments
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(myAliments.aliments, id:\.id) { aliment in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(aliment.nom)
                                .font(.headline)
                            Spacer()
                            Button("Modifier") {
                               //LAter
                            }
                            .buttonStyle(.bordered)
                        }
                        Text("Calories: \(aliment.calories, specifier: "%.0f") kcal")
                        Text("Protéines: \(aliment.proteines, specifier: "%.1f") g")
                        Text("Glucides: \(aliment.glucides, specifier: "%.1f") g")
                        Text("Lipides: \(aliment.lipides, specifier: "%.1f") g")
                    }
                }
            }
        }
    }
}

#Preview {
    
    let alimenttest: Aliment = Aliment(nom: "TestAliment", poidsDeReference: 100.0, calories: 373.4, lipides: 4.2, glucides: 78.0, proteines: 4.3)
    let myAliments: MyAliments = {
        var tmp = MyAliments()
        tmp.aliments.append(alimenttest)
        return tmp
    }()
    ListAlimentView(myAliments: myAliments)
}
