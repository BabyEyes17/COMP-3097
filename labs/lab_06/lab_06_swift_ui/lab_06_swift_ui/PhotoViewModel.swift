//
//  PhotoViewModel.swift
//  lab_06_swift_ui
//
//  Created by Jayden Lewis on 10/03/2026
//

import Foundation

class PhotoViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    
    private let service = PhotoService()
    
    func loadPhotos() {
        
        service.fetchPhotos{
            
            res in
            self.photos = res
        }
    }
}
