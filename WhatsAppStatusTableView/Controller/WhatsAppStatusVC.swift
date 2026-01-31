//
//  ViewController.swift
//  WhatsAppStatusTableView
//
//  Created by Vinay Goud Mothkula on 1/31/26.
//

import UIKit

class WhatsAppStatusVC: UIViewController, UITableViewDelegate {

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
        statusTableView.delegate = self
        
        
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView()
            headerView.backgroundColor = .systemBackground

            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 20) // bold & bigger
            label.textColor = .label
            label.text = "Status"

            headerView.addSubview(label)

            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
                label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 5),
                label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5)
            ])

            return headerView
        }
        return nil // section 1 will use default title
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44
    }

}
extension WhatsAppStatusVC: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return nil
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
