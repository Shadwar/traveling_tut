//
//  Place.swift
//  traveling_tut
//
//  Created by  Иван Ощепков on 24.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct Place: View {
    let data: PlaceData
    let click: () -> Void
    
    init(data: PlaceData, click: @escaping () -> Void) {
        self.data = data
        self.click = click
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button(action: {
                self.click()
            }) {
                Image(data.image).renderingMode(.original)
            }

            Text(data.title).fontWeight(.heavy)

            HStack(spacing: 5) {
                Image("map").renderingMode(.original)
                Text(data.location).foregroundColor(.gray)
            }
        }
    }
}

struct Place_Previews: PreviewProvider {
    static var previews: some View {
        Place(data: PlaceData(id: 0, image: "Card1", title: "Fishing time", location: "Vancouver, CA", type: .activity, activities: [0])) {}
    }
}
