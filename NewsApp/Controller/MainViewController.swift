//
//  ViewController.swift
//  NewsApp
//
//  Created by Aminjoni Abdullozoda on 7/6/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit

class MainViewController: CustomYoNewsViewController {
    
    //MARK:- UI Elements
    var tableView = UITableView()
    var viewModel : NewsViewModelType?
    
    let infoView : UIView =  {
        let view = UIView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideNavigationBar()
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hideNavigationBar()
    }


    fileprivate func setupTableView() {
        view = tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
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
