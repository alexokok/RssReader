//
//  RssTableViewController.swift
//  RssReader
//
//  Created by Alexey Mazaev on 07/02/2019.
//  Copyright © 2019 Alexey Mazaev. All rights reserved.
//

import UIKit
import os.log

class RssTableViewController: UITableViewController {

    // MARK: Properties
    let cellIdentifier = "RssTableViewCell"
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RssTableViewCell else {
            fatalError("The dequeued cell is not an instance of RssInfoViewCell.")
        }
        
        let rssItem = rssFeed[indexPath.row]
        
        cell.title.text = rssItem.title
        cell.address.text = rssItem.rssUrl
        
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }rssAddress
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
         
        case "AddItem":
            os_log("Adding a new RSS.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let rssDetailViewController = segue.destination as? RssDetailsViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedRssCell = sender as? RssTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedRssCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedRss = rssFeed[indexPath.row]
            rssDetailViewController.rss = selectedRss
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    //MARK: - Actions
    @IBAction func unwindToRss(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? RssViewController, let newRss = sourceViewController.rss {
            
            let newIndexPath = IndexPath(row: rssFeed.count, section: 0)
            
            rssFeed.append(newRss)
            
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    // MARK: - Private Methods
    private func loadSampleRss() {
        let rss1 = RssInformation(title: "Some RSS", rssUrl: "https://www.someaddress.com/address")
        let rss2 = RssInformation(title: "Another RSS", rssUrl: "https://www.someaddress.com/address")
        let rss3 = RssInformation(title: "New RSS", rssUrl: "https://www.someaddress.com/address")
        let rss4 = RssInformation(title: "And another one RSS", rssUrl: "https://www.someaddress.com/address")
        let rss5 = RssInformation(title: "Another new RSS", rssUrl: "https://www.someaddress.com/address")
        let rss6 = RssInformation(title: "RSS", rssUrl: "https://www.someaddress.com/address")
        let rss7 = RssInformation(title: "RSS", rssUrl: "https://www.someaddress.com/addresss")
        
        rssFeed += [rss1, rss2, rss3, rss4, rss5, rss6, rss7]
    }

}
