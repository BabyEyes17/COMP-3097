//
//  Photo.swift
//  lab_06_swift_ui
//
//  Created by Jayden Lewis on 10/03/2026
//

import Foundation

struct Photo: Identifiable, Decodable {
    
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
