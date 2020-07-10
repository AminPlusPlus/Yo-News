//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Aminjoni Abdullozoda on 7/6/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var article : Article? {
        didSet {
            //update view
            guard let article = article else {return}
            title.text = article.title
            sourceTitle.text = (article.source?.name)! + " ⚡️"
        }
    }
    
    //MARK:- UI Elements
    private var sourceTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Reuters "
        label.font = UIFont.preferredFont(forTextStyle: .subheadline, compatibleWith: .init(legibilityWeight: .bold))
    
        return label
    }()

    private var newsImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bolt.fill")
        imageView.tintColor = .orange
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var title : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.numberOfLines = 3
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
    }
    
   
    //MARK:- Setup View
    private func setupView() {
        addSubview(newsImage)
        addSubview(title)
        addSubview(sourceTitle)
      
        selectionStyle = .none
        
        
        NSLayoutConstraint.activate([
            
            //sourceTitle
            sourceTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            sourceTitle.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
            
            //news-image
            newsImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            newsImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 50),
            newsImage.widthAnchor.constraint(equalToConstant: 50),
           
            //title
            title.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10),
            title.topAnchor.constraint(equalTo: self.sourceTitle.bottomAnchor, constant: 5),
            title.rightAnchor.constraint(equalTo: self.newsImage.leftAnchor, constant: -5),
        
            
        ])
        
    }

    
    
    
    
    
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
