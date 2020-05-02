//
//  NetworkingManager.swift
//  QuakesApp
//
//  Created by Supannee Mutitanon on 2/5/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation

class NetworkingManager: ObservableObject {
    @Published var dataList = QuakeAPIList(features: [])
    
    init() {
        guard let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson") else { return }
        URLSession.shared.dataTask(with: url) { (data,_,_) in
            guard let data = data else { return }
            let datalist = try! JSONDecoder().decode(QuakeAPIList.self.self, from: data)
            
            DispatchQueue.main.async {
                self.dataList = datalist
                print(datalist)
            }
        }.resume()

    }
}
