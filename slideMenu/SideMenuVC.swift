//
//  SideMenuVC.swift
//  slideMenu
//
//  Created by Ирина Улитина on 08/10/2018.
//  Copyright © 2018 Christian Benua. All rights reserved.
//

import UIKit

class SideMenuVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.separatorColor = .white
        tableView.register(MenuTablewViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(profileCell.self, forCellReuseIdentifier: "profile")
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTablewViewCell
        if indexPath.row == 0 {
            cell.imageName = "002-news"
            cell.label.text = "   Journal"
        } else if indexPath.row == 1 {
            cell.imageName = "003-info"
            cell.label.text = "   Profile"
        } else {
            cell.imageName = "supermarket"
            cell.label.text = "   Subscribe"
        }
        return cell
    }
    */
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 150.0
        } else {
            return 40.0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profile", for: indexPath) as! profileCell
            cell.imgView.layer.cornerRadius = 70
            print("\n\n\n\n")
            print(cell.imgView.topAnchor)
            print(cell.imgView.rightAnchor)
            print("\n\n\n\n")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTablewViewCell
            if indexPath.row == 3 {
                cell.imageName = "002-news"
                cell.label.text = "Journal"
                cell.label.textAlignment = .left
            } else if indexPath.row == 4 {
                cell.imageName = "003-info"
                cell.label.text = "Profile"
                cell.label.textAlignment = .left

            } else if indexPath.row == 5 {
                cell.imageName = "supermarket"
                cell.label.text = "Subscribe"
                cell.label.textAlignment = .left

            }
            return cell

        }
        
        // Configure the cell...
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            let profileVC = ProfileViewController()
            NotificationCenter.default.post(name: NSNotification.Name("PROFILE"), object: nil)
        } else if indexPath.row == 3 {
            NotificationCenter.default.post(name: NSNotification.Name("JOURNAL"), object: nil)
        }
    }
}
