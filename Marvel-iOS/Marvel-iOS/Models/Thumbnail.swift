//
//  Thumbnail.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 15/12/21.
//

import Foundation

class Thumbnail: Decodable {
    
    var path: String = ""
    var jpg: String = ""
    
    enum CodingKeys: String, CodingKey {
        case path
        case jpg = "extension"
    }
    
}
