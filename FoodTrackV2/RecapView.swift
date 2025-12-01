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
    @Query var ApportsJournalier : [ApportJournalier]
    @Query var Portions: [Portion]
    
    @State private var selectedDate: Date = Date()
    
    private var apportsJournalierSelectedDate: [ApportJournalier] {
            ApportsJournalier.filter {
                Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
            }
    }
    
    var body: some View {
        NavigationStack{
            Form{
                HStack {
                    Button(action: {
                        selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) ?? selectedDate
                    }) {
                        Image(systemName: "chevron.left")
                    }
                    Spacer()
                    
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
                    Spacer()
                    Button(action: {
                        selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) ?? selectedDate
                    }) {
                        Image(systemName: "chevron.right")
                    }
                }
                .buttonStyle(.bordered)
                
                if !apportsJournalierSelectedDate.isEmpty {
                    Section{
                        Text("Calories : \(apportsJournalierSelectedDate.first?.calories ?? 0, specifier: "%.1f") kcal")
                        Text("Lipides : \(apportsJournalierSelectedDate.first?.lipides ?? 0, specifier: "%.1f") g")
                        Text("Glucides : \(apportsJournalierSelectedDate.first?.glucides ?? 0, specifier: "%.1f") g")
                        Text("Protèines : \(apportsJournalierSelectedDate.first?.proteines ?? 0, specifier: "%.1f") g")
                    }
                }
                else {
                    Text("Aucune donnée disponible pour cette date")
                        .foregroundColor(.gray)
                        .padding()
                }
                
//                ForEach(ApportsJournalier){ ApportJournalier in
//    
//                    Text(ApportJournalier.date.formatted(date: .long, time: .omitted))
//                        .bold()
//                        .font(.headline)
//                    ForEach(ApportJournalier.portions){ portion in
//                        VStack{
//                            Text(portion.aliment.nom)
//                            Text("Calories:\(portion.calories)")
//                            Text("Glucides:\(portion.glucides)")
//                            Text("Lipides:\(portion.lipides)")
//                            Text("Proteines:\(portion.proteines)")
//                        }
//                    }
//                    
//                }
            }
            .navigationTitle("Récap journalier")
        }
    }
    
    // A voir quoi en faire
//    func supprimerPortion(at offsets: IndexSet) {
//        for offset in offsets {
//            let portion = Portions[offset]
//            modelContext.delete(portion)
//        }
//    }
}

#Preview {
    RecapView()
}
