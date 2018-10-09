//
//  ViewController.swift
//  slideMenu
//
//  Created by Ирина Улитина on 07/10/2018.
//  Copyright © 2018 Christian Benua. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    @IBAction func menuButtonTapped(_ sender: Any) {
     NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    var profileVC : ProfileViewController!
    var journalVC : JournalVC!
    var nav : UINavigationController!
    @IBOutlet weak var sideMenuLayoutConstraint : NSLayoutConstraint!
    private var embeddedViewController : SideMenuVC!
    @IBOutlet weak var ContentContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name(rawValue: "ToggleSideMenu"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setProfile), name: NSNotification.Name(rawValue: "PROFILE"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setJournal), name: NSNotification.Name(rawValue: "JOURNAL"), object: nil)
        /*SideMenuContainer.backgroundColor = .green
        ContentContainer.backgroundColor = .yellow*/
        
        
        /*SideMenuContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        SideMenuContainer.anchor(top: view.topAnchor, left: nil, bottom: view.bottomAnchor, right: ContentContainer.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        ContentContainer.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 100, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        print(SideMenuContainer.frame)
        print(ContentContainer.frame)*/
        journalVC = JournalVC()
        profileVC = ProfileViewController()
        nav = UINavigationController(rootViewController: profileVC)
        
        addChildViewController(profileVC)
        addChildViewController(journalVC)
        //ContentContainer.addSubview(profileVC.view)
        journalVC.didMove(toParentViewController: self)
        self.ContentContainer.addSubview(journalVC.view)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func toggleSideMenu() {
        NotificationCenter.default.post(name: NSNotification.Name("FADE"), object: nil)
        if self.sideMenuLayoutConstraint.constant == -180 {
            self.sideMenuLayoutConstraint.constant = 0
        } else {
            self.sideMenuLayoutConstraint.constant = -180
        }
        UIView.animate(withDuration: 0.6) {
           self.view.layoutIfNeeded()
            if self.sideMenuLayoutConstraint.constant == 0 {
                self.ContentContainer.backgroundColor = .gray
            } else {
                self.ContentContainer.backgroundColor = .white
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func setProfile() {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        profileVC.didMove(toParentViewController: self)
        for v in ContentContainer.subviews {
            v.removeFromSuperview()
        }
        self.ContentContainer.addSubview(profileVC.view)
    }
    
    @objc func setJournal() {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        journalVC.didMove(toParentViewController: self)
        for v in ContentContainer.subviews {
            v.removeFromSuperview()
        }
        var vv = journalVC.view
        self.ContentContainer.addSubview(vv!)
        //vv?.anchor(top: ContentContainer.topAnchor, left: ContentContainer.leftAnchor, bottom: ContentContainer.bottomAnchor, right: ContentContainer.rightAnchor, paddingTop: -1000, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        //vv?.topAnchor.constraint(equalTo: ContentContainer.topAnchor, constant: -30)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SideMenuVC,
            segue.identifier == "table" {
            /*let vc = SideMenuVC()
            self.embeddedViewController = vc
            self.addChildViewController(embeddedViewController)
            embeddedViewController.view.frame = SideMenuContainer.frame
            self.SideMenuContainer.addSubview(embeddedViewController.view)
            embeddedViewController.didMove(toParentViewController: self)*/
        }
    }

}

