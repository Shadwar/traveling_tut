//
//  Experience.swift
//  traveling_tut
//
//  Created by  Иван Ощепков on 24.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct Experience: View {
    let data: ExperienceData
    let selected: Bool
    let click: () -> Void
    
    init(data: ExperienceData, selected: Bool, click: @escaping () -> Void) {
        self.data = data
        self.selected = selected
        self.click = click
    }

    var body: some View {
        Button(action: click) {
            VStack(spacing: 8) {
                Image(data.image).renderingMode(.original)
                Text(data.title).foregroundColor(selected ? .black : .gray)
            }
        }
    }
}

struct Experience_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
        Experience(data: ExperienceData(id: 0, image: "mcard1", title: "Hiking"), selected: true) {}
        Experience(data: ExperienceData(id: 0, image: "mcard1", title: "Hiking"), selected: false) {}
        }
    }
}
