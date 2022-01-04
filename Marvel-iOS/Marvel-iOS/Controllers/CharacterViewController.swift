//
//  ViewController.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 14/12/21.
//

import UIKit

class CharacterViewController: UIViewController {
    
    private var label: UILabel
    private var descriptionLabel: UILabel
    var imageConstrutor = ImageConstructor()
    var loadingAlert = LoadingAlert()
    
    private var resultadoImagem: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var character: Character!
    
    internal required init() {
        label = CharacterViewController.createLabel()
        descriptionLabel = CharacterViewController.createLabel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   static func createLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 20
        return label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(named: "main")
        self.view = view
        resultadoImagem.image = imageConstrutor.getImageData(self.character)
        applyViewCode()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyViewCode()
    }
}

extension CharacterViewController: ViewCodeConfiguration {
   
    func buildHierarchy() {
        view.addSubview(label)
        view.addSubview(descriptionLabel)
        view.addSubview(resultadoImagem)
    }
    
    func setupConstraints() {
        //Name Character
        label.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        //Description
        descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        
        //ResultadoImagem
        resultadoImagem.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40).isActive = true
        resultadoImagem.heightAnchor.constraint(equalToConstant: 350).isActive = true
        resultadoImagem.widthAnchor.constraint(equalToConstant: 350).isActive = true
        resultadoImagem.contentMode = UIView.ContentMode.scaleAspectFit
        resultadoImagem.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func configureViews() {
        // Name Character
        label.text = self.character.name
        label.textAlignment = .center
        label.textColor = .white
        label.layer.masksToBounds = true
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "KohinoorDevanagari-Semibold", size: 40.0)
        
        // Description
        descriptionLabel.text = self.character.description == "" ? "This character doesnt have a description" : self.character.description
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .white
        descriptionLabel.layer.masksToBounds = true
        descriptionLabel.numberOfLines = 6
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.font = UIFont(name: "KohinoorDevanagari-Semibold", size: 30.0)
        
        // Image
        
        resultadoImagem.layer.borderWidth = 10;
        resultadoImagem.layer.borderColor = CGColor(gray: 1, alpha: 1)
        
        navigationItem.backButtonTitle = "Voltar"
    }
}


