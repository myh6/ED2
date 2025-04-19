//
//  FeedViewController.swift
//  EssentialDeviOS
//
//  Created by Min-Yang Huang on 4/18/25.
//

import UIKit
import EssentialDev

final class FeedViewController: UITableViewController {
    private var loader: FeedLoader?
    private var tableModel = [FeedImage]()
    
    convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        refresh()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        load()
    }
    
    @objc private func refresh() {
        refreshControl?.beginRefreshing()
        load()
    }
    
    private func load() {
        loader?.load { [weak self] result in
            self?.tableModel = (try? result.get()) ?? []
            self?.tableView.reloadData()
            self?.refreshControl?.endRefreshing()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = tableModel[indexPath.row]
        let cell = FeedImageCell()
        cell.locationContainer.isHidden = (cellModel.location == nil)
        cell.locationLabel.text = cellModel.location
        cell.descriptionLabel.text = cellModel.description
        return cell
    }
}
