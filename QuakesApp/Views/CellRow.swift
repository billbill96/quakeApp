//
//  CellRow.swift
//  QuakesApp
//
//  Created by Supannee Mutitanon on 2/5/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import SwiftUI

struct CellRow: View {
    var data: Features
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            VStack(alignment: .leading) {
                VStack {
                    Text(String(data.properties.mag))
                        .bold()
                        .foregroundColor(.white)
                        .font(.headline)
                }.frame(width: 100, height: 100)
                    .background(Color.green)
            }.clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(data.properties.place)
                    .foregroundColor(.gray)
                .bold()
                
                Text("\(timeConverter(timeStamp: data.properties.time))")
                .italic()
                    .foregroundColor(.orange)
                    .font(.subheadline)
                    .padding(.top, 2)
            }
            
            
        }
    }
    
    func timeConverter(timeStamp: Double) -> String {
        let unixTimeStamp = timeStamp / 1000
        let date = Date(timeIntervalSince1970: unixTimeStamp)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "dd MMM YY, HH:mm a"
        
        return dateFormatter.string(from: date)
    }
}

