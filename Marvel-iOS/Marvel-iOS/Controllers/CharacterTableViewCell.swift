//
//  CharacterTableViewCell.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 14/12/21.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    var labelName: UILabel = {
             let label = UILabel()
             label.translatesAutoresizingMaskIntoConstraints = false
             label.layer.cornerRadius = 20
             return label
    }()
    
    var imageFoto: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            let screenSize = UIScreen.main.bounds
            let deviceWidth = screenSize.width
            let deviceHeight = screenSize.height*0.2
         
            self.imageFoto = UIImageView(frame: CGRect(x: deviceWidth*0.45, y: deviceHeight*0.05, width: deviceWidth*0.5, height: deviceHeight*0.8))
            self.labelName = UILabel(frame: CGRect(x: deviceWidth*0.05, y: 0, width: deviceWidth*0.4, height: deviceHeight/2))

            applyViewCode()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
extension CharacterTableViewCell: ViewCodeConfiguration { 
    func buildHierarchy() {
        self.addSubview(labelName)
        self.addSubview(imageFoto)
    }
    
    func setupConstraints() {
        self.imageFoto.center.y = (UIScreen.main.bounds.height*0.2)/2
        self.labelName.center.y = (UIScreen.main.bounds.height*0.2)/2
    }
    
    func configureViews() {
        self.labelName.textColor = UIColor(named: "main")
        self.labelName.adjustsFontSizeToFitWidth = true
    
    }
}
