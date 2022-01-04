//
//  Dados.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 15/12/21.
//

import Foundation

class CharactersInfo: Decodable {
    var offset: Int = 0
    var limit : Int = 0
    var total: Int = 0
    var count: Int = 0
    var results: [Character]
    
}
