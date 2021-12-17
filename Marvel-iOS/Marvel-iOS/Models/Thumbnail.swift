//
//  Thumbnail.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 15/12/21.
//

import Foundation

class Thumbnail: Codable {
    
    var path: String = ""
    var jpg: String = ""
    
    var securePath: String{
        let trimmPath = path.dropFirst(4)
        let secureURL = "https" + trimmPath
        return secureURL
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case jpg = "extension"
    }
    
}
