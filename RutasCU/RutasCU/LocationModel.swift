//
//  LocationModel.swift
//  RutasCU
//
//  Created by 2020-1 on 11/12/19.
//  Copyright © 2019 UltaCode. All rights reserved.
//

import UIKit

struct Location: Codable{
    var name: String
    var category : String
    var id: Int
    var coordinates: [Coordenadas]
    var imageName: String
}

struct Coordenadas: Codable {
    var latitude: Double
    var longitude: Double
}

/*struct Nombre: Codable{
    var name: String
}*/
