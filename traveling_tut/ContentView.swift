//
//  ContentView.swift
//  traveling_tut
//
//  Created by  Иван Ощепков on 23.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image("home").font(.title)
            }
            Text("Activity").tabItem {
                Image("activity").font(.title)
            }
            Text("Search").tabItem {
                Image("search").font(.title)
            }
            Text("Settings").tabItem {
                Image("Setting").font(.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let places = PlacesRepository()
        let experiences = ExperiencesRepository()

        return ContentView()
            .environmentObject(experiences)
            .environmentObject(places)
    }
}
