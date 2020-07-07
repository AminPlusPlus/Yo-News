//
//  ViewController.swift
//  NewsApp
//
//  Created by Aminjoni Abdullozoda on 7/6/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK:- UI Elements
    var tableView = UITableView()
    var viewModel : NewsViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "News"
        
        setupTableView()
        
        viewModel = NewsViewModel(DataServiceNews())
        
        startSpinner(forView: self.view, style: .large)
        viewModel?.values.bind(listener: { [unowned self] (_ ) in
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.stopSpinner(forView: self.view)
            }
            
        })
    }

    fileprivate func setupTableView() {
        view = tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        cell.article = viewModel?.articleItem(forIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel?.articleItem(forIndexPath: indexPath)
        let detailVC = DetailViewController()
        detailVC.detailArticle = article
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    

}

