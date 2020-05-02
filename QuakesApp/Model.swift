//
//  Model.swift
//  QuakesApp
//
//  Created by Supannee Mutitanon on 2/5/20.
//  Copyright © 2020 Supannee Mutitanon. All rights reserved.
//

import Foundation

struct Features: Decodable, Hashable {
    var properties: Properties
    var geometry: Geometry
}

struct Properties: Decodable, Hashable {
    var mag: Double
    var place: String
    var time: Double
    var detail: String
    var title: String
}

struct Geometry: Decodable, Hashable {
    var type: String
    var coordinates: [Double]
}

struct QuakeAPIList: Decodable {
    var features: [Features]
}
