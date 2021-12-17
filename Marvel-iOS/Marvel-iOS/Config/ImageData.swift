//
//  ImageData.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 15/12/21.
//

import UIKit

extension UIImage {
    
    func getImageData(_ character: Result) -> UIImage {
        let stringURL = character.thumbnail.securePath + "." + character.thumbnail.jpg
        let url = NSURL(string: stringURL)!
        let imagedData = NSData(contentsOf: url as URL)!
        let image = UIImage(data: imagedData as Data)!
        
        return image
    }
}
