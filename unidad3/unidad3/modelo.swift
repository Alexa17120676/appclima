
//  modelo.swift
//  unidad3
//
//  Created by Mac18 on 29/04/21.
//

import Foundation

struct Modelo{
    let temp: Double
    let nombreCiudad: String
    let id: Int
    
    var tempString: String{
        return String(format: "%.1f", temp)
    }
    
    var obtenerDescripcion: String{
            switch id {
            case 200...232:
                return "cloud.bolt"
            case 300...321:
                return "cloud.hail"
            case 500...531:
                return "cloud.sleet"
            case 600...622:
                return "snow"
            case 701...781:
                return "sun.dust"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud.bolt"
            default:
                return "sun"
            }
        }
    

}
