//
//  ViewCodeConfiguration.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 14/12/21.
//

protocol ViewCodeConfiguration {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCodeConfiguration {
    func configureViews() {}
    
    func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}

