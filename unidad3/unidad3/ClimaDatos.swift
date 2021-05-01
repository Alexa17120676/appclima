//
//  ClimaDatos.swift
//  unidad3
//
//  Created by Mac18 on 29/04/21.
//

import Foundation

struct ClimaDatos: Decodable {
    let name: String
    let main: Main
    let weather: [weather]
}


struct weather: Decodable{
    let description: String
    let id: Double
  
}

struct Main: Decodable{
    let temp: Double
    let feels_like: Double
}
