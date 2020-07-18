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
    
    private let yoNews : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let titleAttribute = NSMutableAttributedString(string: "YO!NEWS", attributes:
            [.font : UIFont.systemFont(ofSize: 25, weight: .bold)]
        )
        let timeAttribute = NSAttributedString(string: "\n18 JULY", attributes: [.font : UIFont.systemFont(ofSize: 25, weight: .bold),.foregroundColor : UIColor.darkGray ])
        
        titleAttribute.append(timeAttribute)
        label.attributedText = titleAttribute
        label.numberOfLines = 2
        
        return label
    }()
    
    private let quoteImage  : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .darkGray
        imageView.image = UIImage(systemName: "paragraph")
        
        return imageView
    }()
    
    private let quoteLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.numberOfLines = 5
       label.text = "“If you want to lift yourself up, lift up someone else.”"
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        
       return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupView()
    }
    
    fileprivate func setupView(){
        addSubViews([yoNews,quoteLabel])
        
        
        NSLayoutConstraint.activate([
            
            //yo news
            yoNews.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            yoNews.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
//            //quote image
//            quoteImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
//            quoteImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            quoteImage.heightAnchor.constraint(equalToConstant: 80),
//            quoteImage.widthAnchor.constraint(equalToConstant: 80),
            
            //quote label
            quoteLabel.leadingAnchor.constraint(equalTo: yoNews.trailingAnchor, constant: 10),
            quoteLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            quoteLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
