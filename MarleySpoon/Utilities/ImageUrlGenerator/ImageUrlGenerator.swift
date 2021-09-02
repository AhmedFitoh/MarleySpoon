//
//  ImageUrlGenerator.swift
//  MarleySpoon
//
//  Created by AhmedFitoh on 9/2/21.
//

import Foundation

class ImageUrlGenerator{
    
    class func generateUrl(path: String) -> URL?{
        let path = generatePath(path: path)
        return URL(string: path)
    }
    
    class func generatePath(path: String) -> String {
        // check if starts with https:
        var path = path
        
        let firstFiveLetters = path.prefix(6).lowercased()
        if firstFiveLetters != "https:" {
            path.insert(contentsOf: "https:", at: path.startIndex)
        }
        
        return path
    }
    
}
