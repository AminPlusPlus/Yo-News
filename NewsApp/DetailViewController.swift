//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Aminjoni Abdullozoda on 7/6/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController,WKNavigationDelegate {
    
    var detailArticle : Article? {
        didSet {
            guard let detail = detailArticle else {
                //alert
                return
            }
            
            let urlRequest = URLRequest(url: URL(string: detail.url!)!)
            webView.load(urlRequest)
            navigationItem.title = detail.source?.name ?? "Headline"
            navigationItem.backBarButtonItem?.tintColor = .black
        }
    }
    
    let webView = WKWebView()

    override func loadView() {
        super.loadView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        startSpinner(forView: self.view, style: .large)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(bookMark))
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        stopSpinner(forView: self.view)
    }
    
    
    @objc func bookMark() {
        print("Bookmark")
    }

}
