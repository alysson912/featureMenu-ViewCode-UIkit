//
//  MenuProfileTableViewCell.swift
//  MenuProfile
//
//  Created by ALYSSON DODO on 02/08/23.
//

import UIKit

class MenuProfileTableViewCell: UITableViewCell {
    
    static  let identifier: String =  String(describing: MenuProfileTableViewCell.self)
    
    let screen = MenuProfileTableViewCellScreen()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configScreen()
        setupConstraints()
        
    }
    
    private func configScreen(){
        selectionStyle = .none
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(title: String){
        screen.titleLabel.text = title
    }
}
