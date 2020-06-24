//
//  ExperienceList.swift
//  traveling_tut
//
//  Created by  Иван Ощепков on 24.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct ExperienceList: View {
    @EnvironmentObject var experiencesRepo: ExperiencesRepository
    @EnvironmentObject var placesRepo: PlacesRepository

    var body: some View {
        VStack {
            HStack {
                Text("What you want?").fontWeight(.heavy)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("View all").fontWeight(.heavy)
                }
            }.padding(.top, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 35) {
                    ForEach(experiencesRepo.experiences) { exp in
                        Experience(
                            data: exp,
                            selected: self.experiencesRepo.selectedExperiences.contains(exp.id)
                        ) { self.filterByExperience(id: exp.id) }
                    }
                }
                
                if (experiencesRepo.experiences.count == 0) {
                    Spacer().frame(height: 90)
                }
            }.padding([.top, .bottom], 15)
        }
    }
    
    private func filterByExperience(id: Int) {
        experiencesRepo.select(id: id)
        placesRepo.filter(experiences: experiencesRepo.selectedExperiences)
    }
}

struct ExperienceList_Previews: PreviewProvider {
    static var previews: some View {
        let experienceRepo = ExperiencesRepository()
        let placesRepo = PlacesRepository()
        
        return ExperienceList()
            .environmentObject(experienceRepo)
            .environmentObject(placesRepo)
            .onAppear {
                experienceRepo.load()
                placesRepo.load()
            }
    }
}
