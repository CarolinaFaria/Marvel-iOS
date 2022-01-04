//
//  ImageData.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 15/12/21.
//

import UIKit

struct ImageConstructor {
    
    func getImageData(_ character: Character) -> UIImage {
        var securePath: String {
            let trimmPath = character.thumbnail.path.dropFirst(4)
            let secureURL = "https" + trimmPath
            return secureURL
        }
        let stringURL = securePath + "." + character.thumbnail.jpg
        let url = NSURL(string: stringURL)!
        let imagedData = NSData(contentsOf: url as URL)!
        let image = UIImage(data: imagedData as Data)!
        
        return image
    }
}
