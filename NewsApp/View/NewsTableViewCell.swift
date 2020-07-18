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
            content.text = article.title
            sourceTitle.text = (article.source?.name)!
            
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        

            if let dateString = article.publishedAt,
                let date = dateFormater.date(from: dateString)  {
                publishedData.text = dateFormater.string(from: date)
            }
            
           
            self.newsImage.image = UIImage(named: "defaul-image-news")
            
            if let urlImage = article.urlToImage {
                 self.fetchImage(imageArticle: urlImage)
            }
           
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
        imageView.contentMode  = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private var content : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.numberOfLines = 3
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    private var publishedData : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
       return label
        
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
    }
    
   
    //MARK:- Setup View
    private func setupView() {
        
        addSubViews([newsImage,
                     content,
                     sourceTitle,
                     publishedData
        ])

      
        selectionStyle = .none
        
        
        NSLayoutConstraint.activate([
            
            //sourceTitle
            sourceTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            sourceTitle.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
            
            //news-image
            newsImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            newsImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 100),
            newsImage.widthAnchor.constraint(equalToConstant: 120),
           
            //title
            content.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10),
            content.topAnchor.constraint(equalTo: self.sourceTitle.bottomAnchor, constant: 5),
            content.rightAnchor.constraint(equalTo: self.newsImage.leftAnchor, constant: -5),
            
            //published date
            publishedData.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10),
            publishedData.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        
            
        ])
        
    }

    
    /// Fetch Image Data
    /// - Parameter imageArticle: URL image coming from fetched data
    private func fetchImage(imageArticle : String) {
       
        let cacheString = NSString(string: imageArticle)
        if let image = DataServiceNews.cache.object(forKey: cacheString) {
            self.newsImage.image = image
        }
        else {
        
            guard let urlImage = URL(string: imageArticle)  else {return}
           
            let imageService = URLSession.shared.dataTask(with: urlImage) { [weak self] (data, responce, error) in
                
                guard let self = self else {return}
              
                guard  error == nil else {return}
                guard let responce  = responce as? HTTPURLResponse, responce.statusCode == 200 else {return}
                guard let data = data else {return}
                
                guard let image = UIImage(data: data) else {return}
                DataServiceNews.cache.setObject(image, forKey: cacheString)
                
                DispatchQueue.main.async {
                    self.newsImage.image = image
                }
                
            }
            
            imageService.resume()
       
        }
       
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
