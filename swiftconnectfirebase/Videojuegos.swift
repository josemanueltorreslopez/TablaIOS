//
//  Videojuegos.swift
//  swiftconnectfirebase
//
//  Created by Antonio y Jose on 23/01/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

// Clase Videojuegos
import Foundation

class Videojuegos {
    
    var titulo: String
    var sinopsis: String
    var pegi: Int
    var valoracion: Int
    var distribuidor: String
    var key : String
    
    init(titulo: String, sinopsis: String, pegi: Int, valoracion: Int, distribuidor: String, key: String) {
        self.titulo = titulo
        self.sinopsis = sinopsis
        self.pegi = pegi
        self.valoracion = valoracion
        self.distribuidor = distribuidor
        self.key = key
    }
}
