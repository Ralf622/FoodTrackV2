//
//  Aliment.swift
//  FoodTrackV2
//
//  Created by Raphael Morel on 07/11/2025.
//

import Foundation
import SwiftData

@Model
class Aliment{
    
    var nom: String
    var poidsDeReference: Double
    var calories: Double
    var lipides: Double
    var glucides: Double
    var proteines: Double
    
    init(nom: String, poidsDeReference: Double, calories: Double, lipides: Double, glucides: Double, proteines: Double) {
        self.nom = nom
        self.poidsDeReference = poidsDeReference
        self.calories = calories
        self.lipides = lipides
        self.glucides = glucides
        self.proteines = proteines
    }
}

struct Portion{
    var aliment : Aliment
    var quantité : Double
    var calories: Double {
        return aliment.calories * (quantité/aliment.poidsDeReference)
    }
    var lipides: Double {
        return aliment.lipides * (quantité/aliment.poidsDeReference)
    }
    var glucides: Double {
        return aliment.glucides * (quantité/aliment.poidsDeReference)
    }
    var proteines: Double {
        return aliment.proteines * (quantité/aliment.poidsDeReference)
    }
}

struct Plat{
    var name: String
    var portions: [Portion]
    
    
    var calories: Double {
        var total: Double = 0
        for portion in portions {
            total+=portion.calories
        }
        return total
    }
}
