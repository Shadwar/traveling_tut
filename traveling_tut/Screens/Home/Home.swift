//
//  Home.swift
//  traveling_tut
//
//  Created by  Иван Ощепков on 24.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var placesRepo: PlacesRepository
    @EnvironmentObject var experiencesRepo: ExperiencesRepository

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            MainMenu()
            
            Text("Find more").fontWeight(.heavy).font(.largeTitle).padding(.top, 15)
            
            TravelTypeMenu()
                .padding(.top, 30)
                .padding(.bottom, 15)
            
            PlaceList()
            ExperienceList().padding(.top, 10)
        }.padding().onAppear(perform: appeared)
    }
    
    private func appeared() {
        placesRepo.load()
        experiencesRepo.load()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        let placesRepo = PlacesRepository()
        let experiencesRepo = ExperiencesRepository()

        return Home().environmentObject(placesRepo).environmentObject(experiencesRepo)
    }
}
