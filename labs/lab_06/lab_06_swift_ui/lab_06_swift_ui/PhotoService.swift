//
//  PhotoService.swift
//  lab_06_swift_ui
//
//  Created by Jayden Lewis on 10/03/2026
//

import Foundation

class PhotoService {
    
    func fetchPhotos(completion: @escaping ([Photo]) -> Void) {
        
        guard let url = URL(string:
            "https://jsonplaceholder.typicode.com/photos") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            
            data, response, error in
            
            guard let data = data else {
                
                completion([])
                return
            }
            
            do {
                
                let res = try JSONDecoder().decode([Photo].self, from: data)
                
                DispatchQueue.main.async {
                    completion(res)
                }
            }
            
            catch {
                
                print(error)
                completion([])
            }
            
        }.resume()
    }
}
