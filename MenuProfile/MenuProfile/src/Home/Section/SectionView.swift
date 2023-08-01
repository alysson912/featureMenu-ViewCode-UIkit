//
//  SectionView.swift
//  MenuProfile
//
//  Created by ALYSSON DODO on 01/08/23.
//

import UIKit

class SectionView: UIView {

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var referenceButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        // btn.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return btn
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var arrowImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .cyan
        image.backgroundColor = .clear
        return image
    }()
    
    private func addViews(){
        addSubview(referenceButton)
        addSubview(arrowImageView)
        addSubview(descriptionLabel)
        addSubview(lineView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupSection(description: String){
        descriptionLabel.text = description
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            referenceButton.topAnchor.constraint(equalTo: topAnchor),
            referenceButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            referenceButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            referenceButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            
        ])
    }
    public func expandButton(value: Bool){
        if value {
            arrowImageView.image = UIImage(systemName: "chevron.compact.up")
        } else {
            arrowImageView.image = UIImage(systemName: "chevron.compact.down")
        }
    }
}
