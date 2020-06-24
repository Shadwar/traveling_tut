//
//  PlaceList.swift
//  traveling_tut
//
//  Created by  Иван Ощепков on 24.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct PlaceList: View {
    @EnvironmentObject var placesRepo: PlacesRepository
    @State var showDetails = false
    @State var place: PlaceData? = nil

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(placesRepo.places) { place in
                    Place(data: place) {
                        self.choosePlace(id: place.id)
                    }
                }
            }

            if (placesRepo.places.count == 0) {
                Spacer().frame(height: 305)
            }
        }.sheet(isPresented: $showDetails) {
            PlaceDetails(data: self.place!)
        }
    }
    
    private func choosePlace(id: Int) {
        self.showDetails.toggle()
        self.place = placesRepo.places.first(where: {place in place.id == id})
    }
}

struct PlaceList_Previews: PreviewProvider {
    static var previews: some View {
        let placesRepo = PlacesRepository()

        return PlaceList().environmentObject(placesRepo).onAppear {
            placesRepo.load()
        }
    }
}
