//
//  RssFeedTableViewController.swift
//  RssReader
//
//  Created by Alexey Mazaev on 07/02/2019.
//  Copyright © 2019 Alexey Mazaev. All rights reserved.
//

import UIKit

class RssTableViewController: UITableViewController {
    
    // MARK: Properties
    let cellIdentifier = "RssInfoViewCell"
    
    var rssFeed = [RssInformation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleRss()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rssFeed.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RssInfoViewCell else {
            fatalError("The dequeued cell is not an instance of RssInfoViewCell.")
        }

        let rssItem = rssFeed[indexPath.row]
        
        cell.rssTitle.text = rssItem.title
        cell.rssAddress.text = rssItem.rssUrl
        
        if rssItem.imageUrl == nil {
            cell.rssImageView.isHidden = false
        } else {
            cell.rssImageView.isHidden = true
        }
        
        return cell
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Private Methods
    private func loadSampleRss() {
        let rss1 = RssInformation("First RSS", "https://www.someaddress.com/")
        let rss2 = RssInformation("First RSS", "https://www.someaddress.com/")
        let rss3 = RssInformation("First RSS", "https://www.someaddress.com/")
        let rss4 = RssInformation("First RSS", "https://www.someaddress.com/")
        let rss5 = RssInformation("First RSS", "https://www.someaddress.com/")
        let rss6 = RssInformation("First RSS", "https://www.someaddress.com/")
        let rss7 = RssInformation("First RSS", "https://www.someaddress.com/")
        
        rssFeed += [rss1, rss2, rss3, rss4, rss5, rss6, rss7]
    }

}
