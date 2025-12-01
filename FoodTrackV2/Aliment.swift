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

@Model
class Portion{
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
    init(aliment: Aliment, quantité: Double) {
        self.aliment = aliment
        self.quantité = quantité
    }
}
@Model
class Plat{
    var nom: String
    var portions: [Portion]
    
    
    var calories: Double {
        portions.reduce(0) { $0 + $1.calories }
    }
    
    var lipides: Double {
        portions.reduce(0) { $0 + $1.lipides }
    }
    
    var glucides: Double {
        portions.reduce(0) { $0 + $1.glucides }
    }
    
    var proteines: Double {
        portions.reduce(0) { $0 + $1.proteines }
    }

    init(nom: String, portions: [Portion]) {
        self.nom = nom
        self.portions = portions
    }
}

@Model
class ApportJournalier{
    var date: Date
    var portions: [Portion]
    var plats: [Plat]
    
    var calories: Double {
        let totPortions = portions.reduce(0) { $0 + $1.calories }
        let totPlat = plats.reduce(0) { $0 + $1.calories }
        return totPortions + totPlat
    }

    var lipides: Double {
        let totPortions = portions.reduce(0) { $0 + $1.lipides }
        let totPlat = plats.reduce(0) { $0 + $1.lipides }
        return totPortions + totPlat
    }

    var glucides: Double {
        let totPortions = portions.reduce(0) { $0 + $1.glucides }
        let totPlat = plats.reduce(0) { $0 + $1.glucides }
        return totPortions + totPlat
    }

    var proteines: Double {
        let totPortions = portions.reduce(0) { $0 + $1.proteines }
        let totPlat = plats.reduce(0) { $0 + $1.proteines }
        return totPortions + totPlat
    }
    init(date: Date, portions: [Portion] = [], plats: [Plat] = []) {
        self.date = date
        self.portions = portions
        self.plats = plats
    }

    
    

    
}
