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
        
            //        // add shadow on cell
            tintColor = .white
            backgroundColor = UIColor(named: "main")
            layer.masksToBounds = false

            // add corner radius on `contentView`
            contentView.backgroundColor = .white
            contentView.layer.cornerRadius = 8
            contentView.layer.shadowRadius = 7
            contentView.layer.shadowOpacity = 1
            contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
            contentView.layer.shadowColor = UIColor.darkGray.cgColor
            contentView.layer.masksToBounds = false
                
            let screenSize = UIScreen.main.bounds
            let deviceWidth = screenSize.width
            let deviceHeight = screenSize.height*0.2
         
            self.imageFoto = UIImageView(frame: CGRect(x: deviceWidth*0.45, y: deviceHeight*0.05, width: deviceWidth*0.4, height: deviceHeight*0.8))
            self.labelName = UILabel(frame: CGRect(x: deviceWidth*0.05, y: 0, width: deviceWidth*0.35, height: deviceHeight/2))

            applyViewCode()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
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
        self.labelName.numberOfLines = 0
        self.labelName.font = UIFont(name: "KohinoorDevanagari-Semibold", size: 25.0)
        
        self.imageFoto.layer.cornerRadius = 4
        self.imageFoto.clipsToBounds = true


    
    }
}
