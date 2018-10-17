//
//  Serie.swift
//  iOsPrueba
//
//  Created by JOAQUIN DIAZ RAMIREZ on 3/10/18.
//  Copyright © 2018 JOAQUIN DIAZ RAMIREZ. All rights reserved.
//

import Foundation
class Serie{
    var name: String!
    var imageFile : String!
    var summary : String!
    var seasons : Int!
    var actors : [Actors]!

    
    
    init(name : String, imageFile : String , summary: String, seasons: Int, actors: [Actors]) {
        self.name = name
        self.imageFile = imageFile
        self.summary = summary
        self.seasons = seasons
        self.actors = actors
    }
}
