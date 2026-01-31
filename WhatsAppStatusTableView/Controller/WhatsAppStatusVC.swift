//
//  ViewController.swift
//  WhatsAppStatusTableView
//
//  Created by Vinay Goud Mothkula on 1/31/26.
//

import UIKit

class WhatsAppStatusVC: UIViewController {

    @IBOutlet weak var statusTableView: UITableView!
    var data: [StatusData]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = StatusData.getData()
        navigationItem.title = "Updates"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true

        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.sizeToFit()
        statusTableView.tableHeaderView = searchBar
        
        // Do any additional setup after loading the view.
        
        statusTableView.dataSource = self
        
        
        
    }

}
extension WhatsAppStatusVC: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Your Status"
        }
        return "Recent updates"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let myCell = tableView.dequeueReusableCell(withIdentifier: "YourSatusCell") as! YourSatusCell
            
            return myCell
            
        }else{
            let otherCell = tableView.dequeueReusableCell(withIdentifier: "OtherSatusCell") as! OtherSatusCell
            let statusData = data?[indexPath.row]
            otherCell.sendData(sendData: statusData)
            return otherCell}
        
        
    }
}
