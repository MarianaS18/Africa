//
//  VideoModel.swift
//  Africa
//
//  Created by Mariana Steblii on 11/04/2021.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
