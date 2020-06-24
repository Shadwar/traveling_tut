//
//  PlacesRepository.swift
//  traveling_tut
//
//  Created by  Иван Ощепков on 24.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import Foundation
import Combine

enum PlaceType {
    case experience, adventure, activity
}

struct PlaceData: Identifiable {
    let id: Int
    let image: String
    let title: String
    let location: String
    let type: PlaceType
    let activities: [Int]
}

class PlacesRepository: ObservableObject {
    private var data = [PlaceData]()
    private var currentData = [PlaceData]()
    @Published var currentType: PlaceType = .experience
    @Published var places = [PlaceData]()
    
    func load() -> Void {
        self.data = [
            PlaceData(id: 0, image: "Card1", title: "Fishing time", location: "Vancouver, CA", type: .experience, activities: [0]),
            PlaceData(id: 1, image: "Card2", title: "Forest Camping", location: "Vancouver, CA", type: .adventure, activities: [1]),
        ]
            
        self.places = self.data
        self.currentData = self.data
    }
    
    func filter(experiences: [Int]) -> Void {
        if experiences.count == 0 {
            self.places = self.currentData
        } else {
            self.places = self.currentData.filter { $0.activities.filter(experiences.contains).count > 0 }
        }
    }
    
    func filter(type: PlaceType) -> Void {
        self.currentType = type
        self.currentData = self.data.filter { $0.type == type }
        self.places = self.currentData
    }
}
