//
//  JournalVC.swift
//  slideMenu
//
//  Created by Ирина Улитина on 08/10/2018.
//  Copyright © 2018 Christian Benua. All rights reserved.
//

import UIKit



class JournalVC: UITableViewController {

    var myColor : UIColor = UIColor.white
    /* look here
    @IBAction func onMenuTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        tableView.tableHeaderView = nil
        tableView.contentInset = UIEdgeInsets(top: -0, left: 0, bottom: 150, right: 0)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: -0, left: 0, bottom: 150, right: 0)
        //navigationController?.navigationBar.isHidden = true
        //tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        tableView.register(TextTableViewCell.self, forCellReuseIdentifier: "cell")
        NotificationCenter.default.addObserver(self, selector: #selector(fadeOut), name: NSNotification.Name("FADE"), object: nil)
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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TextTableViewCell
        cell.backgroundColor = myColor
        return cell
    }
    
    @objc func fadeOut() {
        var vw = UIView()
        vw.backgroundColor = .gray
        vw.alpha = 0
        if tableView.alpha == 1.0 {
            view.addSubview(vw)
            vw.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        }
        
        
        print(view.superview)
            UIView.animate(withDuration: 0.4, animations: {
                if (self.tableView.alpha == 1.0) {
                    //self.view.superview?.alpha = 0.6
                    vw.alpha = 0.2
                    self.tableView.alpha = 0.6
                    self.tableView.backgroundColor = UIColor(white: 1.0, alpha: 0.6)
                    self.view.backgroundColor = UIColor(white: 1.0, alpha: 0.6)
                } else {
                    //self.view.superview?.alpha = 1.0
                    vw.alpha = 0
                    self.tableView.alpha = 1.0
                    self.tableView.backgroundColor = UIColor.white
                    self.view.backgroundColor = UIColor(white: 1.0, alpha: 1.0)

                }
            }) { (_) in
                //self.tableView.reloadData()
                if (self.tableView.alpha == 0.6) {
                    self.view.subviews.first?.removeFromSuperview()
                }
            }
        //}
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
