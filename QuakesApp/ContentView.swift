//
//  ContentView.swift
//  QuakesApp
//
//  Created by Supannee Mutitanon on 2/5/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkingManager = NetworkingManager()
    
    
    var body: some View {
        NavigationView {
            List(networkingManager.dataList.features, id: \.properties) {
                data in
                NavigationLink(destination: QuakeDetails(data: data)) {
                    CellRow(data: data)
                }.navigationBarTitle("Quakes")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews:  some View {
        ContentView()
    }
}
