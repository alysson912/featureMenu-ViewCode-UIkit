//
//  HomeScreen.swift
//  MenuProfile
//
//  Created by ALYSSON DODO on 31/07/23.
//

import UIKit

class HomeScreen: UIView {

    lazy var genericLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Olá Mundo!"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        return label
    }()
    
    private func addViews(){
        addSubview(genericLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
        
            genericLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            genericLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
