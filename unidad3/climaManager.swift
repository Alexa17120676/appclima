//
//  climaManager.swift
//  unidad3
//
//  Created by Mac18 on 29/04/21.
//

import Foundation

protocol ClimaManagerDelegado {
    func actualizarClima(clima: Modelo)
}

struct ClimaManager{
    let climaURL = "https://api.openweathermap.org/data/2.5/weather?appid=6a58e34bd5936a9c03d4f86c6582e6af&units=metric&lang=es"
    
    var delegado: ManejadorclimaDelegado?
    
    
    func buscarClima(ciudad: String){
        let urlString = "\(climaURL)&q=\(ciudad)"
        realizarSolicitud(urlString: urlString)
    }
    
    func realizarSolicitud(urlString: String){
        if let url = URL(string: urlString){
        
        let session = URLSession(configuration: .default)
        
            let tarea = session.dataTask(with: url) { (datos, respuesta, error) in
                if error != nil {
                    print("Se produjo un error: \(error!)")
                    return
                }
                
                if let datosSeguros = datos {
                    if let objClima = self.parsearJSON(datosClima: datosSeguros){
                       
            
                    self.delegado?.actualizarClima(clima: objClima)
                    }
                   
                }
            }
        
            tarea.resume()
            
        
    }
}
    
        /*if let respuestaServidor = respuesta {
            print("Respuesta del server: \(respuestaServidor)")
        }*/
    func  parsearJSON(datosClima: Data) -> Modelo?{
        let decodificador = JSONDecoder()
        do{
            let datosDecodificados = try
                decodificador.decode(ClimaDatos.self, from: datosClima)
            
            /*print("La ciudad es: \(datosDecodificados.name)")
            print("La temp es: \(datosDecodificados.main.temp)")
            print("sensacion termica es: \(datosDecodificados.main.feels_like)")
            print("descripcion: \(datosDecodificados.weather[0].description)")
            print("id: \(datosDecodificados.weather[0].id)")
            print("id: \(datosDecodificados.weather[0].id)")*/
            let id = datosDecodificados.weather[0].id
            let ciudad = datosDecodificados.name
            let temp = datosDecodificados.main.temp
            
            let objClima = Modelo(temp: temp, nombreCiudad: ciudad, id: Int(id))
            
          print(objClima.obtenerDescripcion)
         print(objClima.tempString)
           
            
        } catch {
            print("Error al decodificar los datos\(error.localizedDescription)")
            return nil
        }
        return nil
    }
      


}
