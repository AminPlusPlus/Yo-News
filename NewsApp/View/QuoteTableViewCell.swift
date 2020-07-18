//
//  QuoteTableViewCell.swift
//  NewsApp
//
//  Created by Aminjoni Abdullozoda on 7/18/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    
    //MARK:- UI Elements
    private let quoteImage  : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemOrange
        imageView.image =  UIImage(systemName: "text.quote")
        
        return imageView
    }()
    
    private let quoteLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 5
       label.text = "Be who you are and say what you feel, because those who mind don't matter and those who matter don't mind"
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        
       return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupView()
    }
    
    fileprivate func setupView(){
        addSubViews([quoteImage,quoteLabel])
        
        
        NSLayoutConstraint.activate([
            
            //quote image
            quoteImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            quoteImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            quoteImage.heightAnchor.constraint(equalToConstant: 80),
            quoteImage.widthAnchor.constraint(equalToConstant: 80),
            
            //quote label
            quoteLabel.leftAnchor.constraint(equalTo: quoteImage.rightAnchor, constant: 10),
            quoteLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            quoteLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
