//
//  MainMenu.swift
//  traveling_tut
//
//  Created by  Иван Ощепков on 24.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Image("menu").renderingMode(.original)
            }
            
            Spacer()
            
            Button(action: {
                
            }) {
                Image("Profile").renderingMode(.original)
            }
        }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
