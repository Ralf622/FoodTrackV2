//
//  RecapView.swift
//  FoodTrackV2
//
//  Created by Raphael Morel on 07/11/2025.
//

import SwiftUI

struct RecapView: View {
    var myAliments: MyAliments
    
    var body: some View {
        NavigationStack{
            ForEach (myAliments.aliments, id: \.id) { aliment in
                Section(aliment.nom){
                    Text("Calories:\(aliment.calories)")
                }
            }
            
        }
    }
}

#Preview {
    RecapView(myAliments: MyAliments())
}
