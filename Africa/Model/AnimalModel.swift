//
//  AnimalModel.swift
//  Africa
//
//  Created by Mariana Steblii on 10/04/2021.
//

import Foundation

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
