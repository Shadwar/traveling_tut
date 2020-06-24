//
//  PlaceDetails.swift
//  traveling_tut
//
//  Created by  Иван Ощепков on 24.06.2020.
//  Copyright © 2020  Иван Ощепков. All rights reserved.
//

import SwiftUI

struct PlaceDetails: View {
    let data: PlaceData
    
    var body: some View {
        VStack {
            Image("topbg").resizable()
                .aspectRatio(1.35, contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 500)
                .offset(y: -200).padding(.bottom, -200)
            
            GeometryReader { geo in
                VStack(alignment: .leading) {
                    DetailTop(title: self.data.title)
                    DetailMiddle(location: self.data.location)
                    DetailBottom()
                }
            }.background(Color.white)
            .clipShape(Rounded())
            .padding(.top, -75)
        }
    }
}

struct PlaceDetails_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetails(data: PlaceData(id: 0, image: "Card1", title: "Fishing time", location: "Vancouver, CA", type: .activity, activities: [0]))
    }
}

struct DetailTop: View {
    let title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title).fontWeight(.heavy).font(.largeTitle)
                }
                
                Spacer()
                
                Text("$299").foregroundColor(Color("bg")).font(.largeTitle)
            }
        }.padding()
    }
}

struct DetailMiddle: View {
    let location: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 5) {
                Image("map").renderingMode(.original)
                Text(location).foregroundColor(Color("bg"))
            }
            
            HStack(spacing: 8) {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill").font(.body).foregroundColor(.yellow)
                }
            }
            
            Text("People").fontWeight(.heavy)
            Text("Number Of People In Your Group?").foregroundColor(.gray)
            
            HStack(spacing: 6) {
                ForEach(0..<5) { i in
                    Button(action: {}) {
                        Text("\(i + 1)").foregroundColor(.white).padding(20)
                    }.background(Color("bg"))
                    .cornerRadius(8)
                }
            }
        }.padding(.horizontal, 15)
    }
}

struct DetailBottom: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Description").fontWeight(.heavy)
            Text("Some very long description about place, just a little move words.").foregroundColor(.gray)
            
            HStack(spacing: 8) {
                Button(action: {}) {
                    Image("Save").renderingMode(.original)
                }
                
                Spacer()
                
                Button(action: {}) {
                    HStack(spacing: 6) {
                        Text("Book Your Experience")
                        Image("arrow").renderingMode(.original)
                    }.foregroundColor(.white)
                    .padding()
                }.background(Color("bg"))
                .cornerRadius(8)
            }.padding(.top, 15)
        }.padding()
    }
}
