//
//  FoodTrackV2App.swift
//  FoodTrackV2
//
//  Created by Raphael Morel on 06/11/2025.
//

import SwiftUI
import SwiftData
@main
struct FoodTrackV2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Aliment.self)
    }
}
