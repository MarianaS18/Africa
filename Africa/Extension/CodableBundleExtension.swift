//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Mariana Steblii on 10/04/2021.
//

import Foundation

extension Bundle {
    
    // decode the local JSON file
    func decodeOneType(_ file: String) -> [CoverImage] {
        // 1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Fail to locate \(file) in bundle")
        }
        
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Fail to load \(file) from bundle")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode([CoverImage].self, from: data) else {
            fatalError("Fail to decode \(file) from bundle")
        }
        
        // 5. Return the ready-to-use data
        return loaded
    }
    
    
    
    // generic moethod
    func decode<T: Codable>(_ file: String) -> [T] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Fail to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Fail to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([T].self, from: data) else {
            fatalError("Fail to decode \(file) from bundle")
        }
        
        // 5. Return the ready-to-use data
        return loaded
    }
}
