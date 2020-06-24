//
//  TravelTypeMenu.swift
//  traveling_tut
//
//  Created by  Иван Ощепков on 24.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct TravelTypeMenu: View {
    @EnvironmentObject var placesRepo: PlacesRepository
    @EnvironmentObject var experiencesRepo: ExperiencesRepository

    var body: some View {
        HStack {
            Button(action: {
                self.select(.experience)
            }) {
                Text("Experiences")
                    .fontWeight(placesRepo.currentType == .experience ? .heavy : .regular)
                    .foregroundColor(placesRepo.currentType == .experience ? .black : .gray)
            }
            
            Spacer()

            Button(action: {
                self.select(.adventure)
            }) {
                Text("Adventures")
                    .fontWeight(placesRepo.currentType == .adventure ? .heavy : .regular)
                    .foregroundColor(placesRepo.currentType == .adventure ? .black : .gray)
            }
            
            Spacer()

            Button(action: {
                self.select(.activity)
            }) {
                Text("Activities")
                    .fontWeight(placesRepo.currentType == .activity ? .heavy : .regular)
                    .foregroundColor(placesRepo.currentType == .activity ? .black : .gray)
            }
        }
    }
    
    private func select(_ type: PlaceType) {
        placesRepo.filter(type: type)
        experiencesRepo.clear()
    }
}

struct TravelTypeMenu_Previews: PreviewProvider {
    static var previews: some View {
        TravelTypeMenu()
    }
}
