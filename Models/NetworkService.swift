//
//  NetworkService.swift
//  NavigTest
//
//  Created by Mac on 07.01.2023.
//

import Foundation

struct Planet: Decodable {
    
    var name: String
    var orbital_period: String
    var terrain: String
    
    
    enum CodingKeys: String, CodingKey {
        case name, orbital_period = "orbitalPeriod", terrain
    }
}



struct Data {

    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}



struct NetworkService {
    
     func request( completion: ((_ title: String?)-> Void)?) {

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with:URL(string: "https://jsonplaceholder.typicode.com/todos/1")!) { dat, responce, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion?(nil)
                return
            }
            
            if  (responce as! HTTPURLResponse).statusCode != 200 {
                print("STATUS CODE != 200, Status code = \((responce as! HTTPURLResponse).statusCode)")
                completion?(nil)
                return
            }
            
            guard let dat = dat else {
                print("NO DATA")
                completion?(nil)
                
                return
            }
            
            do {

                
                let answer = try JSONSerialization.jsonObject(with: dat, options: [.allowFragments])  as? [String: Any]

                if let title = answer?["title"] as? String {
                    completion?(title)
                    return
                    
                }
            } catch {
                print(error.localizedDescription)
            }
      completion?(nil)
        }
        task.resume()
    }
    
    func requestForPlanet(completion: ((_ planet: Planet?) -> Void)?) {
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: URL(string: "https://swapi.dev/api/planets/1")!) { data,
            responce, error in
            
            if let error = error {
                print("ERRor block1 \(error.localizedDescription)")
                return
            }
            
            if (responce as! HTTPURLResponse).statusCode != 200 {
                print("Status Code Ne = 200")
                return
            }
            guard let data = data else {
                print("NO DATA")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let planet =  try decoder.decode(Planet.self, from: data)
                completion?(planet)
                print(planet)
            return
            } catch {
                print("ERROR BLOCK 2\(error.localizedDescription)")
            }
            
            completion?(nil)
        }
        task.resume()
        
    }
}




