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
            subTitle.text = article.content
        }
    }
    
    //MARK:- UI Elements
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
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    private var subTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "lLeft and Right constraints are absolute, they will always refer to the left/right of the screen or the control. Leading and trailing constraints are affected by the device locale"
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.numberOfLines = 2
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
        addSubview(subTitle)
      
        selectionStyle = .none
        
        
        NSLayoutConstraint.activate([
            //news-image
            newsImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            newsImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 50),
            newsImage.widthAnchor.constraint(equalToConstant: 50),
           
            //title
            title.leftAnchor.constraint(equalTo: self.newsImage.rightAnchor,constant: 10),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
           
            //subtitle
            subTitle.leftAnchor.constraint(equalTo: self.newsImage.rightAnchor, constant: 10),
            subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor,constant: 2),
            subTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            
        ])
        
    }

    
    
    
    
    
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
