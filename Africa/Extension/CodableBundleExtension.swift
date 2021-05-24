//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Bra Emma on 06/05/2021.
//

import Foundation

// a generic json reader class that can read any form of json
extension Bundle{
    // the underscore means we don't have to enter the name of the parameter each time we call the function
    func decode<T: Codable>(_ file: String) -> T{
        // 1. locate the json file
        guard let url = self.url(forResource: file, withExtension: nil)else{
            fatalError("Failed to locate \(file) in bundle")
        }
        
        // 2. create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(file) from bundle")
        }
        
        // 3. create a decoder
        let decoder = JSONDecoder()
        
        // 4. create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to locate \(file) from bundle")
        }
        
        // 5. return the ready to use data
        return loaded
    }
}
