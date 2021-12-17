//
//  Dados.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 15/12/21.
//

import Foundation

class Dados: Codable{
    var offset: Int = 0
    var limit : Int = 0
    var total: Int = 0
    var count: Int = 0
    var results: [Result]
    
}
