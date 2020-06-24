//
//  ExperiencesRepository.swift
//  traveling_tut
//
//  Created by  Иван Ощепков on 24.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import Foundation

struct ExperienceData: Identifiable {
    let id: Int
    let image: String
    let title: String
}

class ExperiencesRepository: ObservableObject {
    private var data = [ExperienceData]()
    @Published var experiences = [ExperienceData]()
    @Published var selectedExperiences = [Int]()

    func load() -> Void {
        data = [
            ExperienceData(id: 0, image: "mcard1", title: "Hiking"),
            ExperienceData(id: 1, image: "mcard2", title: "Ski"),
            ExperienceData(id: 2, image: "mcard3", title: "Sky Diving"),
            ExperienceData(id: 3, image: "mcard4", title: "Skate Board")
        ]
        
        experiences = data
        selectedExperiences = []
    }
    
    func select(id: Int) -> Void {
        if (selectedExperiences.contains(id)) {
            selectedExperiences = selectedExperiences.filter { selectedId in
                selectedId != id
            }
        } else {
            selectedExperiences.append(id)
        }
    }
    
    func clear() -> Void {
        selectedExperiences.removeAll()
    }
}
