//
//  RssTableViewController.swift
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        cell.rssName.text = rssItem.title
        cell.rssAddress.text = rssItem.rssUrl
        
        
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
        let rss1 = RssInformation("Some RSS", "https://www.someaddress.com/address")
        let rss2 = RssInformation("Another RSS", "https://www.someaddress.com/address")
        let rss3 = RssInformation("New RSS", "https://www.someaddress.com/address")
        let rss4 = RssInformation("And another one RSS", "https://www.someaddress.com/address")
        let rss5 = RssInformation("Another new RSS", "https://www.someaddress.com/address")
        let rss6 = RssInformation("RSS", "https://www.someaddress.com/address")
        let rss7 = RssInformation("RSS", "https://www.someaddress.com/addresss")
        
        rssFeed += [rss1, rss2, rss3, rss4, rss5, rss6, rss7]
    }

}
